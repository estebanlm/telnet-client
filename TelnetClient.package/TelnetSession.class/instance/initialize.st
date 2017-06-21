initialization
initialize
	super initialize.
	activeHandlers := OrderedCollection new.
	protocolHandlers := Set new.
	self addProtocolHandler: TelnetSGAHandler new