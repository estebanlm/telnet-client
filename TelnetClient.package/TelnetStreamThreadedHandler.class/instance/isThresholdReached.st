testing
isThresholdReached
	^ self stream size > 0 
		and: [ super isThresholdReached ]