accessing
millisecondsToWait
	^ millisecondsToWait ifNil: [ self class defaultMillisecondsToWait ]