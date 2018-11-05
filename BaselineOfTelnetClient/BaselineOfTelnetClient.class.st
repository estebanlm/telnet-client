Class {
	#name : #BaselineOfTelnetClient,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTelnetClient'
}

{ #category : #baselines }
BaselineOfTelnetClient >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self taskIt: spec.
		
		spec package: 'TelnetClient' with: [ 
			spec requires: #('Logger' 'TaskIt') ]  ] 	
]

{ #category : #'external projects' }
BaselineOfTelnetClient >> logger: spec [
	spec
		baseline: 'Logger' with: [ 
			spec repository: 'github://estebanlm/logger:master' ];
		import: 'Logger'
]

{ #category : #'external projects' }
BaselineOfTelnetClient >> taskIt: spec [
	spec
		baseline: 'TaskIt' with: [ 
			spec repository: 'github://sbragagnolo/TaskIt:master' ];
		import: 'TaskIt'
]
