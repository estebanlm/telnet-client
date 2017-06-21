private
processNext: aByte
	aByte = IAC ifTrue: [ ^ (TelnetCommandHandler on: self) activate ].
	self activeHandler processNext: aByte