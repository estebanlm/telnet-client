private
delay
	^ delay ifNil: [ delay := (Delay forMilliseconds: self millisecondsToWait) ]