accessing
propertyAt: anObject
	^ self 
		propertyAt: anObject 
		ifAbsent: [ NotFound signalFor: anObject ]