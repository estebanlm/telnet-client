private
listenLoop
	[ [ socketStream isNil or: [ socketStream atEnd ] ]
	whileFalse: [ self processNext: self next ] ] 
	forkAt: Processor highIOPriority 
	named: ('Telnet session running at: {1}:{2}' format: { self host. self port })