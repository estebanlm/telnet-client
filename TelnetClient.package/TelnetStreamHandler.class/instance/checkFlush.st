private
checkFlush
	| contents |
	"Flushes all information collected and resets the stream"
	self isThresholdReached ifFalse: [ ^ self ].
	contents := stream contents.
	stream reset.
	self session announce: (TelnetDataReceived new 
		data: contents;
		yourself).
	