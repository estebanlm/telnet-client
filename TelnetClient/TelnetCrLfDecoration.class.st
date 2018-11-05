Class {
	#name : #TelnetCrLfDecoration,
	#superclass : #TelnetDataDecoration,
	#category : 'TelnetClient-DataDecoration'
}

{ #category : #testing }
TelnetCrLfDecoration >> isThresholdReached [
	^ (self handler stream peekLast: 2) = #[13 10]
]
