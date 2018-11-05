"
I'm a command processing handler.
I receive commands and dispatch them to their  respective protocol handlers if they are defined, otherwise I reject the protocol.
"
Class {
	#name : #TelnetCommandHandler,
	#superclass : #TelnetHandler,
	#category : 'TelnetClient-Handler'
}

{ #category : #processing }
TelnetCommandHandler >> acceptProtocol: protocolId command: aCommand [
	aCommand = DO ifTrue: [ self nextPutAll: (ByteArray with: IAC with: WILL with: protocolId) ].
	aCommand = WILL ifTrue: [ self nextPutAll: (ByteArray with: IAC with: DO with: protocolId) ].
	self log debug: [ 'Protocol {1} accepted.' format: { protocolId } ].
	"TelnetError signal: 'Does not understand command ', protocolId asString"
	self deactivate.
]

{ #category : #processing }
TelnetCommandHandler >> processNext: aByte [
	"handler was activated with next = IAC. 
	 Telnet protocol is IAC COMMAND PROTOCOL ..."
	| protocolId protocol command |
	
	command := aByte.
	protocolId := self next.
	protocol := self session
		protocolAt: protocolId
		ifAbsent: [ ^ self rejectProtocol: protocolId command: command ].
	((command = DO) or: [ command = WILL]) 
		ifTrue: [ ^ self acceptProtocol: protocolId command: command ].
	protocol activate.
	protocol processNext: command.
	self deactivate.
]

{ #category : #processing }
TelnetCommandHandler >> rejectProtocol: protocolId command: aCommand [
	aCommand = DO ifTrue: [ self nextPutAll: (ByteArray with: IAC with: WONT with: protocolId) ].
	aCommand = WILL ifTrue: [ self nextPutAll: (ByteArray with: IAC with: DONT with: protocolId) ].
	self log debug: [ 'Protocol {1} rejected.' format: { protocolId } ].
	"TelnetError signal: 'Does not understand command ', protocolId asString"
	self deactivate.
]
