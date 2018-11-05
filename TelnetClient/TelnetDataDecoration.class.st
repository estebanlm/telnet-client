"
I'm a decoration for data chunks in someway.
I'm abstract, my children will provide real functionality.
"
Class {
	#name : #TelnetDataDecoration,
	#superclass : #Object,
	#instVars : [
		'handler'
	],
	#category : 'TelnetClient-DataDecoration'
}

{ #category : #accessing }
TelnetDataDecoration >> handler [
	^ handler
]

{ #category : #accessing }
TelnetDataDecoration >> handler: anObject [
	handler := anObject
]

{ #category : #testing }
TelnetDataDecoration >> isThresholdReached [
	^ self subclassResponsibility
]
