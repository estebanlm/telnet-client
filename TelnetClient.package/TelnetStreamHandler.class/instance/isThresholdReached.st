testing
isThresholdReached
	^ (stream size >= self flushSize)
		and: [ super isThresholdReached ]