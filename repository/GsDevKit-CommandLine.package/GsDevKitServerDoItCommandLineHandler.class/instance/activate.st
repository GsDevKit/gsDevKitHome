activation
activate
	self activateHelp
		ifTrue: [ ^ self ].
	self arguments size < 1
		ifTrue: [ 
			self printHelp.
			^ self exitFailure: 'Missing arguments' ].
	Author
		useAuthor: 'gsDevKit'
		during: [ 
			[ self evaluate ]
				on: Error
				do: [ :ex | self exitFailure: ex description ] ].
	self exitSuccess