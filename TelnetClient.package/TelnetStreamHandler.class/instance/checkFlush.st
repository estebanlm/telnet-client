private
checkFlush
	"Flushes all information collected and resets the stream"
	self stream isEmpty ifTrue: [ ^ self ].
	self isThresholdReached ifFalse: [ ^ self ].
	self flush