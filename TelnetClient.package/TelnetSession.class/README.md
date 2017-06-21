I'm a telnet session.
I can stablish a connection to a server and interact on several ways. 

The input can be processed through handlers who will adapt input to different scenarios (protocols, etc.)

Examples: 

TelnetSession new 
	connectToHostNamed: 'localhost' port: 5555;
	when: TelnetDataReceived do: [ :ann | Transcript show: ann data ].