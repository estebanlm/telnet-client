private
validateNotConnected
	self isConnected ifTrue: [ 
		self error: 'Telnet cannot be connected to set the handler' ].