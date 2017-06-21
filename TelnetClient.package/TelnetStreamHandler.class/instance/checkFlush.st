private
checkFlush
	"Flushes all information collected and resets the stream"
	self isThresholdReached ifFalse: [ ^ self ].
	self flush	