"
I'm an announcer that schedules all announces.
"
Class {
	#name : #TelnetScheduledAnnouncer,
	#superclass : #Announcer,
	#instVars : [
		'taskRunner'
	],
	#category : 'TelnetClient-Core'
}

{ #category : #announce }
TelnetScheduledAnnouncer >> announce: anAnnouncement [
	^ taskRunner schedule: [ 
		super announce: anAnnouncement ]
]

{ #category : #initialization }
TelnetScheduledAnnouncer >> initialize [
	super initialize.
	taskRunner := TKTNewProcessTaskRunner new
]
