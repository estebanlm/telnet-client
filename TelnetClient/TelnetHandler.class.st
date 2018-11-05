"
I'm an abstract handler for telnet input data. 
My children will define different behaviour, from the basic processing to the more complex protocol handlers.
"
Class {
	#name : #TelnetHandler,
	#superclass : #Object,
	#traits : 'TLogueable',
	#classTraits : 'TLogueable classTrait',
	#instVars : [
		'session'
	],
	#pools : [
		'TelnetConstantsRFC854'
	],
	#category : 'TelnetClient-Handler'
}

{ #category : #'instance creation' }
TelnetHandler class >> on: aTelnetSession [
	^ self new session: aTelnetSession
]

{ #category : #activation }
TelnetHandler >> activate [
	self session pushHandler: self
]

{ #category : #activation }
TelnetHandler >> deactivate [
	self session popHandler
]

{ #category : #'stream in' }
TelnetHandler >> next [
	^ self session next
]

{ #category : #'stream out' }
TelnetHandler >> nextPut: aByte [
	self session nextPut: aByte
]

{ #category : #'stream out' }
TelnetHandler >> nextPutAll: aCollection [
	self session nextPutAll: aCollection
]

{ #category : #processing }
TelnetHandler >> processNext: aByte [
	self subclassResponsibility
]

{ #category : #accessing }
TelnetHandler >> session [ 
	^ session
]

{ #category : #accessing }
TelnetHandler >> session: aTelnetSession [
	session := aTelnetSession
]
