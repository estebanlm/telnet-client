accessing
protocolAt: anId ifAbsent: aBlock
	^ protocolHandlers 
		detect: [ :each | each isProtocol: anId ]
		ifNone: aBlock