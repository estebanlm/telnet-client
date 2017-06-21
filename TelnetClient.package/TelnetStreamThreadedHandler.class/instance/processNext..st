processing
processNext: aByte
	self mutex critical: [ stream nextPut: aByte ].
	