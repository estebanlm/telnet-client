private
defaultHandler
	^ defaultHandler ifNil: [ defaultHandler := self createDefaultHandler ]