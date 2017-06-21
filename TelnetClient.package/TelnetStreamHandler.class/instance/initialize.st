initialization
initialize
	super initialize.
	stream := (ByteArray new: self class bufferSize) writeStream