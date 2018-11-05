"
I inform some data has been received.
"
Class {
	#name : #TelnetDataReceived,
	#superclass : #TelnetAnnouncement,
	#instVars : [
		'data',
		'properties'
	],
	#category : 'TelnetClient-Announcement'
}

{ #category : #accessing }
TelnetDataReceived >> data [
	^ data
]

{ #category : #accessing }
TelnetDataReceived >> data: anObject [
	data := anObject
]

{ #category : #accessing }
TelnetDataReceived >> propertyAt: anObject [
	^ self 
		propertyAt: anObject 
		ifAbsent: [ NotFound signalFor: anObject ]
]

{ #category : #accessing }
TelnetDataReceived >> propertyAt: anObject ifAbsent: aBlock [
	properties ifNil: [ ^ aBlock value ].
	^ properties 
		at: anObject 
		ifAbsent: aBlock
]

{ #category : #accessing }
TelnetDataReceived >> propertyAt: anObject put: otherObject [ 
	properties ifNil: [ properties := SmallDictionary new ].
	properties at: anObject put: otherObject
]
