connection
connectTo: hostName port: portNumber
	self close.
	host := hostName.
	port := portNumber.
	self open.
	self handler activate.
	self listenLoop