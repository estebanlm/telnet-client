processing
processNext: aByte
	stream nextPut: aByte.
	self checkFlush