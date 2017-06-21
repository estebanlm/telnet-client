announce
announce: anAnnouncement
	^ taskRunner schedule: [ 
		super announce: anAnnouncement ]