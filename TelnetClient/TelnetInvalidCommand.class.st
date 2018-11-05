"
I indicate an invalid command has been sent. 
This may means also I cannot understand the command sent for some reason.
"
Class {
	#name : #TelnetInvalidCommand,
	#superclass : #TelnetError,
	#instVars : [
		'command'
	],
	#category : 'TelnetClient-Exception'
}

{ #category : #accessing }
TelnetInvalidCommand >> command [
	^ command
]

{ #category : #accessing }
TelnetInvalidCommand >> command: anObject [
	command := anObject
]

{ #category : #accessing }
TelnetInvalidCommand >> messageText [
	^ 'The command {1} is invalid in this context.' format: { self command }
]
