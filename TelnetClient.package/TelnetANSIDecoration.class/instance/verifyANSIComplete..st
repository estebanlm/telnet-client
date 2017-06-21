private
verifyANSIComplete: aString
	"This is a hacky way to check for ANSI completion without scaning all string. 
	 I assume that an ANSI escape will not be larger than 12... this is just a 
	 guessed number and maybe needs adjustement."
	| scanFrom command size ansiTerminal |
	
	ansiTerminal := #($m $J).
	size := aString size.
	command := 0.
	scanFrom := size - (size min: 12) + 1.
	scanFrom to: size do: [ :i | | ch |
		ch := aString at: i.
		ch = Character escape 
			ifTrue: [ command := command + 1 ].
		(command > 0 and: [ ansiTerminal includes: ch ]) 
			ifTrue: [ command := command - 1 ] ].

	^ command = 0