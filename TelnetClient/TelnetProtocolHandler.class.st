"
I'm an abstract handler for protocols. 
I'm activated by aTelnetCommandHandler and my purpose is to allow the processing of spiciphic protocols. 
See my children for examples.
"
Class {
	#name : #TelnetProtocolHandler,
	#superclass : #TelnetHandler,
	#category : 'TelnetClient-Handler'
}

{ #category : #testing }
TelnetProtocolHandler >> isProtocol: aByte [
	"Answer if we implement the protocol required"
	^ self subclassResponsibility
]
