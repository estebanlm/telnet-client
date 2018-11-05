"
I'm a NULL data handler who discards anything received. 
I'm used in case you forget to add a real data handler to your session :)
"
Class {
	#name : #TelnetNULLHandler,
	#superclass : #TelnetDataHandler,
	#category : 'TelnetClient-Handler'
}

{ #category : #processing }
TelnetNULLHandler >> processNext: aByte [
	"Just ignore imput, this will be a default handler"
]
