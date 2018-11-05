"
I'm a generic handler to collect data.
This handlers cannot be deactivated.
"
Class {
	#name : #TelnetDataHandler,
	#superclass : #TelnetHandler,
	#instVars : [
		'decorations'
	],
	#category : 'TelnetClient-Handler'
}

{ #category : #accessing }
TelnetDataHandler >> addDecoration: aTelnetDecoration [
	aTelnetDecoration handler: self.
	decorations := decorations copyWith: aTelnetDecoration
]

{ #category : #activation }
TelnetDataHandler >> deactivate [
	"Do nothing"
]

{ #category : #accessing }
TelnetDataHandler >> decorations [
	^ decorations
]

{ #category : #initialization }
TelnetDataHandler >> initialize [
	super initialize.
	decorations := #()
]

{ #category : #testing }
TelnetDataHandler >> isThresholdReached [
	^ self decorations allSatisfy: [ :each | each isThresholdReached ]
]
