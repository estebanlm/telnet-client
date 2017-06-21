accessing
handler: aHandler
	"Sets the default handler"
	self validateNotConnected.
	aHandler session: self.
	defaultHandler := aHandler