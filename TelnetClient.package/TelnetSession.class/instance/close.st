connection
close
	socketStream ifNil: [ ^ self ].
	socketStream close.
	socketStream := nil.
	self announce: TelnetSessionClosed new