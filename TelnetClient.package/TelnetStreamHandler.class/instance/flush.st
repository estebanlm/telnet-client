private
flush	
	| contents |
	contents := stream contents.
	stream reset.
	self session announce: (TelnetDataReceived new 
		data: contents;
		yourself)