"
I ensure a received chunk of data has ANSI commands absent or complete (otherwise parsers can fail).
"
Class {
	#name : #TelnetEnsureANSIDecoration,
	#superclass : #TelnetDataDecoration,
	#category : 'TelnetClient-DataDecoration'
}

{ #category : #testing }
TelnetEnsureANSIDecoration >> isThresholdReached [
	^ self verifyANSIComplete: self handler stream contents
]

{ #category : #private }
TelnetEnsureANSIDecoration >> verifyANSIComplete: aByteArray [
	"This is a hacky way to check for ANSI completion without scaning all string. 
	 I assume that an ANSI escape will not be larger than 12... this is just a 
	 guessed number and maybe needs adjustement."
	| scanFrom command size ansiTerminal |
	
	ansiTerminal :=  #[109 74]. "$m $J" 
	size := aByteArray size.
	command := 0.
	scanFrom := size - (size min: 12) + 1.
	scanFrom to: size do: [ :i | | ch |
		ch := aByteArray at: i.
		ch = 27 "ESC" ifTrue: [ command := command + 1 ].
		(command > 0 and: [ ansiTerminal includes: ch ]) 
			ifTrue: [ command := command - 1 ] ].

	^ command = 0
]
