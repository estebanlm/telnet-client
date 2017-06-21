accessing
flushSize: aNumber
	"Flush cannot be bigger than buffer size"
	flushSize := aNumber min: self class bufferSize