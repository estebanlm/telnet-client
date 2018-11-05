"
I'm a basic telnet read stream that will flush (announce data) when wauntity arrives to flushSize.
"
Class {
	#name : #TelnetStreamHandler,
	#superclass : #TelnetDataHandler,
	#instVars : [
		'stream',
		'flushSize'
	],
	#category : 'TelnetClient-Handler'
}

{ #category : #accessing }
TelnetStreamHandler class >> bufferSize [
	^ 2048
]

{ #category : #accessing }
TelnetStreamHandler class >> flushSize [
	^ 512
]

{ #category : #accessing }
TelnetStreamHandler >> alwaysFlush [
	self flushSize: 0
]

{ #category : #private }
TelnetStreamHandler >> checkFlush [
	"Flushes all information collected and resets the stream"
	self stream isEmpty ifTrue: [ ^ self ].
	self isThresholdReached ifFalse: [ ^ self ].
	self flush
]

{ #category : #private }
TelnetStreamHandler >> flush [	
	| contents |
	contents := stream contents.
	stream resetContents.
	self session announce: (TelnetDataReceived new 
		data: contents;
		yourself)
]

{ #category : #accessing }
TelnetStreamHandler >> flushSize [
	^ flushSize ifNil: [ self class flushSize ]
]

{ #category : #accessing }
TelnetStreamHandler >> flushSize: aNumber [
	"Flush cannot be bigger than buffer size"
	flushSize := aNumber min: self class bufferSize
]

{ #category : #initialization }
TelnetStreamHandler >> initialize [
	super initialize.
	stream := (ByteArray new: self class bufferSize) writeStream
]

{ #category : #testing }
TelnetStreamHandler >> isThresholdReached [
	^ (stream size >= self flushSize)
		and: [ super isThresholdReached ]
]

{ #category : #processing }
TelnetStreamHandler >> processNext: aByte [
	stream nextPut: aByte.
	self checkFlush
]

{ #category : #accessing }
TelnetStreamHandler >> stream [
	^ stream
]
