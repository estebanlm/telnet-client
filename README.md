# telnet-client
A telnet client for Pharo

This is how you start a session (for now): 

```Smalltalk
TelnetSession new 
	handler: (TelnetStreamHandler new 
		alwaysFlush;
		addDecoration: TelnetLfDecoration new;
		addDecoration: TelnetANSIDecoration new;
		yourself);
	addProtocolHandler: MUDTelnetMSDPHandler new;
	when: TelnetDataReceived do: [ :ann | ann data asString crLog ];
	when: MUDMSDPCommandReceived do: [ :ann | ann variable crLog ];
	connectTo: 'legendsofthejedi.com' port: 5656.
```

*the "MUD" part is as an example, taken from my other project [MUDClient](http://github.com/estebanlm/MUDClient)*
