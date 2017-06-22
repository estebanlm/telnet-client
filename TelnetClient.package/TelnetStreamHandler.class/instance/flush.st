private
flush	
	| contents |
	contents := stream contents.
	stream resetContents.
	self session announce: (TelnetDataReceived new 
		data: contents;
		yourself)