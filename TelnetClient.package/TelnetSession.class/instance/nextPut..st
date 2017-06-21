stream out
nextPut: aByte
	^ self stream 
		nextPut: aByte;
		flush