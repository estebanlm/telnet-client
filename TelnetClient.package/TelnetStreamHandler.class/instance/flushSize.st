accessing
flushSize
	^ flushSize ifNil: [ self class flushSize ]