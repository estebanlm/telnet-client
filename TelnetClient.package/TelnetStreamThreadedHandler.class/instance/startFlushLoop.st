private
startFlushLoop
	[ [ self session isConnected ]
	  whileTrue: [ 
			self mutex critical: [ self checkFlush ].
			self wait ] ]	
	forkAt: Processor highIOPriority 
	named: ('Telnet stream read on: {1}:{2}' format: { self session host. self session port })