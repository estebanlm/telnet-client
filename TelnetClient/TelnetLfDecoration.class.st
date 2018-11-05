Class {
	#name : #TelnetLfDecoration,
	#superclass : #TelnetDataDecoration,
	#category : 'TelnetClient-DataDecoration'
}

{ #category : #testing }
TelnetLfDecoration >> isThresholdReached [
	^ (self handler stream peekLast) = 10
]
