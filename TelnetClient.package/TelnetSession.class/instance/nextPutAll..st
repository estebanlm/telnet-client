stream out
nextPutAll: aCollection
	^ self stream 
		nextPutAll: aCollection;
		flush