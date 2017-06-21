accessing
propertyAt: anObject put: otherObject 
	properties ifNil: [ properties := SmallDictionary new ].
	properties at: anObject put: otherObject