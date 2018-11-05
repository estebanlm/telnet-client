"
I'm a handler for SUPPRESS-GO-AHEAD  (SGA) protocol.
This protocol needs to be accepted but then nothing else needs to be processed (and no other commands will be received), so I do not need to override #processNext:
"
Class {
	#name : #TelnetSGAHandler,
	#superclass : #TelnetProtocolHandler,
	#category : 'TelnetClient-Handler'
}

{ #category : #testing }
TelnetSGAHandler >> isProtocol: aByte [
	^ aByte == SGA
]
