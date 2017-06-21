*TelnetClient-DataDecoration
peekLast: aNumber
	"Return that item just put at the end of the stream"

	^ position >= aNumber 
		ifTrue: [ collection copyFrom: position - aNumber + 1 to: position ]
		ifFalse: [ nil ]