connection
open
	| socket |
	socket := Socket new 
		connectToHostNamed: self host 
		port: self port.
	socketStream := (SocketStream on: socket) 
		binary;
		noTimeout.
	self log debug: [ 'Session opened at {1}:{2}' format: { self host. self port } ].
	self announce: TelnetSessionOpened new