processing
acceptProtocol: protocolId command: aCommand
	aCommand = DO ifTrue: [ self nextPutAll: (ByteArray with: IAC with: WILL with: protocolId) ].
	aCommand = WILL ifTrue: [ self nextPutAll: (ByteArray with: IAC with: DO with: protocolId) ].
	self log debug: [ 'Protocol {1} accepted.' format: { protocolId } ].
	"TelnetError signal: 'Does not understand command ', protocolId asString"
	self deactivate.