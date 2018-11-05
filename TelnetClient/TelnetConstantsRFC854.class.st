"
Straight from RFC854

NAME               CODE              MEANING

      SE                  240    End of subnegotiation parameters.
      NOP                 241    No operation.
      Data Mark           242    The data stream portion of a Synch.
                                 This should always be accompanied
                                 by a TCP Urgent notification.
      Break               243    NVT character BRK.
      Interrupt Process   244    The function IP.
      Abort output        245    The function AO.
      Are You There       246    The function AYT.
      Erase character     247    The function EC.
      Erase Line          248    The function EL.
      Go ahead            249    The GA signal.
      SB                  250    Indicates that what follows is
                                 subnegotiation of the indicated
                                 option.
      WILL (option code)  251    Indicates the desire to begin
                                 performing, or confirmation that
                                 you are now performing, the
                                 indicated option.
      WON'T (option code) 252    Indicates the refusal to perform,
                                 or continue performing, the
                                 indicated option.
      DO (option code)    253    Indicates the request that the
                                 other party perform, or
                                 confirmation that you are expecting
                                 the other party to perform, the
                                 indicated option.
      DON'T (option code) 254    Indicates the demand that the
                                 other party stop performing,
                                 or confirmation that you are no
                                 longer expecting the other party
                                 to perform, the indicated option.
      IAC                 255    Data Byte 255.

"
Class {
	#name : #TelnetConstantsRFC854,
	#superclass : #SharedPool,
	#classVars : [
		'AO',
		'AYT',
		'BRK',
		'DM',
		'DO',
		'DONT',
		'EC',
		'EL',
		'GA',
		'IAC',
		'IP',
		'NOP',
		'SB',
		'SE',
		'SGA',
		'WILL',
		'WONT'
	],
	#category : 'TelnetClient-Core'
}

{ #category : #initialization }
TelnetConstantsRFC854 class >> initialize [
	"self initialize"
	SGA :=3. "suppress go ahead"
	SE := 240.
	NOP := 241.
	DM := 242.
	BRK := 243.
	IP := 244.
	AO := 245.
	AYT := 246.
	EC := 247.
	EL := 248.
	GA := 249.
	SB := 250.
	WILL := 251.
	WONT := 252.
	DO := 253.
	DONT := 254.
	IAC := 255
]
