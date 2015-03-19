accessing
snapshotFile
	snapshotFile
		ifNil: [ 
			self arguments size > 2
				ifTrue: [ snapshotFile := (self arguments at: 3) asFileReference ]
				ifFalse: [ ^ super snapshotFile ] ].
	^ snapshotFile