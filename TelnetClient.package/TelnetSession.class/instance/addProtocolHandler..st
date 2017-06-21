accessing
addProtocolHandler: aHandler
	"Sets the default handler"
	self validateNotConnected.
	aHandler session: self.
	protocolHandlers add: aHandler