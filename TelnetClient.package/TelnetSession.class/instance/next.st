steam in
next 
	^ [ self stream next ]
		on: ConnectionClosed 
		do: [ :e | self close. 0 ]