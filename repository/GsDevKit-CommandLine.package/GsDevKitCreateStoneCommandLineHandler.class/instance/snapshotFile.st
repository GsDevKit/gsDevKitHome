accessing
snapshotFile
	snapshotFile
		ifNil: [ 
			self arguments size > 3
				ifTrue: [ snapshotFile := (self arguments at: 3) asFileReference ]
				ifFalse: [ ^ super snapshotFile ] ].
	^ snapshotFile