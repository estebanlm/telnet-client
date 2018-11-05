"
I'm a basic handler that sends all input received to trasncript. 
Tipically, I'm used just to test, I do not think my use can be of more use :)
"
Class {
	#name : #TelnetTranscriptHandler,
	#superclass : #TelnetDataHandler,
	#category : 'TelnetClient-Handler'
}

{ #category : #processing }
TelnetTranscriptHandler >> processNext: aByte [
	Transcript show: aByte asCharacter asString
]
