private
handler
	^ handler ifNil: [ handler := self createDefaultHandler ]