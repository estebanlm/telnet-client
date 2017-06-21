baselines
baseline: spec
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self taskIt: spec.
		
		spec package: 'TelnetClient' with: [ 
			spec requires: #('Logger' 'TaskIt') ]  ] 	