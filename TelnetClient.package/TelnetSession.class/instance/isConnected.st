testing
isConnected
	^ self stream notNil 
		and: [ self stream isConnected ]