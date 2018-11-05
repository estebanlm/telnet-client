"
I'm a stream that checks for flush at a regular interval (by default, each 100ms).
This will achieved by spawning a thread which is not very good... but so far it seems to work.
"
Class {
	#name : #TelnetStreamThreadedHandler,
	#superclass : #TelnetStreamHandler,
	#instVars : [
		'delay',
		'millisecondsToWait',
		'mutex'
	],
	#category : 'TelnetClient-Handler'
}

{ #category : #accessing }
TelnetStreamThreadedHandler class >> defaultMillisecondsToWait [
	^ 100
]

{ #category : #activation }
TelnetStreamThreadedHandler >> activate [
	self startFlushLoop.
	super activate
]

{ #category : #private }
TelnetStreamThreadedHandler >> delay [
	^ delay ifNil: [ delay := (Delay forMilliseconds: self millisecondsToWait) ]
]

{ #category : #initialization }
TelnetStreamThreadedHandler >> initialize [
	super initialize.
	self flushSize: 0. "We do not check by size"
]

{ #category : #testing }
TelnetStreamThreadedHandler >> isThresholdReached [
	^ self stream isEmpty not 
		and: [ super isThresholdReached ]
]

{ #category : #accessing }
TelnetStreamThreadedHandler >> millisecondsToWait [
	^ millisecondsToWait ifNil: [ self class defaultMillisecondsToWait ]
]

{ #category : #private }
TelnetStreamThreadedHandler >> mutex [
	^ mutex ifNil: [ mutex := Mutex new ]
]

{ #category : #processing }
TelnetStreamThreadedHandler >> processNext: aByte [
	self mutex critical: [ stream nextPut: aByte ].
	
]

{ #category : #private }
TelnetStreamThreadedHandler >> startFlushLoop [
	[ [ self session isConnected ]
	  whileTrue: [ 
			self mutex critical: [ self checkFlush ].
			self wait ] ]	
	forkAt: Processor lowIOPriority 
	named: ('Telnet stream read on: {1}:{2}' format: { self session host. self session port })
]

{ #category : #private }
TelnetStreamThreadedHandler >> wait [
	self delay wait
]
