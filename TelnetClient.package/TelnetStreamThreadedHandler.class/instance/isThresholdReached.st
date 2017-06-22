testing
isThresholdReached
	^ self stream isEmpty not 
		and: [ super isThresholdReached ]