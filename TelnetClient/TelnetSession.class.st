"
I'm a telnet session.
I can stablish a connection to a server and interact on several ways. 

The input can be processed through handlers who will adapt input to different scenarios (protocols, etc.)

Examples: 

TelnetSession new 
	connectToHostNamed: 'localhost' port: 5555;
	when: TelnetDataReceived do: [ :ann | Transcript show: ann data ].
"
Class {
	#name : #TelnetSession,
	#superclass : #Object,
	#traits : 'TLogueable',
	#classTraits : 'TLogueable classTrait',
	#instVars : [
		'host',
		'port',
		'announcer',
		'socketStream',
		'activeHandlers',
		'protocolHandlers',
		'handler'
	],
	#pools : [
		'TelnetConstantsRFC854'
	],
	#category : #'TelnetClient-Core'
}

{ #category : #accessing }
TelnetSession >> activeHandler [
	^ activeHandlers last
]

{ #category : #accessing }
TelnetSession >> addProtocolHandler: aHandler [
	"Sets the default handler"
	self validateNotConnected.
	aHandler session: self.
	protocolHandlers add: aHandler
]

{ #category : #announcing }
TelnetSession >> announce: anAnnouncement [
	self announcer announce: anAnnouncement.
]

{ #category : #announcing }
TelnetSession >> announcer [ 
	^ announcer ifNil: [ announcer := TelnetScheduledAnnouncer new ] 
]

{ #category : #connection }
TelnetSession >> close [
	socketStream ifNil: [ ^ self ].
	socketStream close.
	socketStream := nil.
	self announce: TelnetSessionClosed new
]

{ #category : #connection }
TelnetSession >> connectTo: hostName port: portNumber [
	self close.
	host := hostName.
	port := portNumber.
	self open.
	self handler activate.
	self listenLoop
]

{ #category : #'private factory' }
TelnetSession >> createDefaultHandler [
	^ TelnetNULLHandler on: self
]

{ #category : #private }
TelnetSession >> handler [
	^ handler ifNil: [ handler := self createDefaultHandler ]
]

{ #category : #accessing }
TelnetSession >> handler: aHandler [
	"Sets the default handler"
	self validateNotConnected.
	aHandler session: self.
	handler := aHandler
]

{ #category : #accessing }
TelnetSession >> host [
	^ host
]

{ #category : #initialization }
TelnetSession >> initialize [
	super initialize.
	activeHandlers := OrderedCollection new.
	protocolHandlers := Set new.
	self addProtocolHandler: TelnetSGAHandler new
]

{ #category : #testing }
TelnetSession >> isConnected [
	^ self stream notNil 
		and: [ self stream isConnected ]
]

{ #category : #private }
TelnetSession >> listenLoop [
	[ [ socketStream isNil or: [ socketStream atEnd ] ]
	whileFalse: [ self processNext: self next ] ] 
	forkAt: Processor highIOPriority 
	named: ('Telnet session running at: {1}:{2}' format: { self host. self port })
]

{ #category : #'stream in' }
TelnetSession >> next [ 
	^ [ self stream next ]
		on: ConnectionClosed 
		do: [ :e | self close. 0 ]
]

{ #category : #'stream out' }
TelnetSession >> nextPut: aByte [
	^ self stream 
		nextPut: aByte;
		flush
]

{ #category : #'stream out' }
TelnetSession >> nextPutAll: aCollection [
	^ self stream 
		nextPutAllFlush: aCollection
]

{ #category : #connection }
TelnetSession >> open [
	| socket |
	socket := Socket new 
		connectToHostNamed: self host 
		port: self port.
	socketStream := (SocketStream on: socket) 
		binary;
		noTimeout.
	self log debug: [ 'Session opened at {1}:{2}' format: { self host. self port } ].
	self announce: TelnetSessionOpened new
]

{ #category : #private }
TelnetSession >> popHandler [
	activeHandlers removeLast
	
]

{ #category : #accessing }
TelnetSession >> port [
	^ port
]

{ #category : #private }
TelnetSession >> processNext: aByte [
	aByte = IAC ifTrue: [ ^ (TelnetCommandHandler on: self) activate ].
	self activeHandler processNext: aByte
]

{ #category : #accessing }
TelnetSession >> protocolAt: anId ifAbsent: aBlock [
	^ protocolHandlers 
		detect: [ :each | each isProtocol: anId ]
		ifNone: aBlock
]

{ #category : #private }
TelnetSession >> pushHandler: aHandler [
	activeHandlers addLast: aHandler
]

{ #category : #accessing }
TelnetSession >> stream [
	^ socketStream
]

{ #category : #private }
TelnetSession >> validateNotConnected [
	self isConnected ifTrue: [ 
		self error: 'Telnet cannot be connected to set the handler' ].
]

{ #category : #announcing }
TelnetSession >> weakWhen: anAnnoucement send: aSelector to: anObject [
	self announcer weak 	
		when: anAnnoucement 
		send: aSelector 
		to: anObject 	
]

{ #category : #announcing }
TelnetSession >> when: anAnnoucement do: anObject [ 
	self announcer 	
		when: anAnnoucement  
		do: anObject 
]

{ #category : #announcing }
TelnetSession >> when: anAnnoucement send: aSelector to: anObject [ 
	self announcer 	
		when: anAnnoucement 
		send: aSelector 
		to: anObject 
]
