processing
rejectProtocol: protocolId command: aCommand
	aCommand = DO ifTrue: [ self nextPutAll: (ByteArray with: IAC with: WONT with: protocolId) ].
	aCommand = WILL ifTrue: [ self nextPutAll: (ByteArray with: IAC with: DONT with: protocolId) ].
	self log debug: [ 'Protocol {1} rejected.' format: { protocolId } ].
	"TelnetError signal: 'Does not understand command ', protocolId asString"
	self deactivate.