accessing
propertyAt: anObject ifAbsent: aBlock
	properties ifNil: [ ^ aBlock value ].
	^ properties 
		at: anObject 
		ifAbsent: aBlock