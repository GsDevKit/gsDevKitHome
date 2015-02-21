activation
activate
	Transcript
		cr;
		show: 'installTode [0]'.
	self activateHelp
		ifTrue: [ ^ self ].
	self arguments size < 1
		ifTrue: [ 
			self printHelp.
			^ self exitFailure: 'Missing arguments' ].
	Author
		useAuthor: 'gsDevKit'
		during: [ 
			Transcript
				cr;
				show: 'installTode [1]'.
			self installTode.
			Transcript
				cr;
				show: 'installTode [2]'.
			(Smalltalk os environment at: 'GS_TRAVIS' ifAbsent: [  ]) = 'true'
				ifTrue: [ 
					Transcript
						cr;
						show: 'installTode [3]'.
					self installTravisTode2 ]
				ifFalse: [ 
					Transcript
						cr;
						show: 'installTode [4]'.
					self installTode2 ] ].
	Transcript
		cr;
		show: 'installTode [5]'.
	Transcript cr.
	self exitSuccess