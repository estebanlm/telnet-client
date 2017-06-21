processing
processNext: aByte
	"handler was activated with next = IAC. 
	 Telnet protocol is IAC COMMAND PROTOCOL ..."
	| protocolId protocol command |
	
	command := aByte.
	protocolId := self next.
	protocol := self session
		protocolAt: protocolId
		ifAbsent: [ ^ self rejectProtocol: protocolId command: command ].
	((command = DO) or: [ command = WILL]) 
		ifTrue: [ ^ self acceptProtocol: protocolId command: command ].
	protocol activate.
	protocol processNext: command.
	self deactivate.