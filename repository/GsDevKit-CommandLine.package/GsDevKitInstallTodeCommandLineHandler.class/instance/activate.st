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
			[ 
			self installTode.
			(Smalltalk os environment at: 'GS_TRAVIS') ~= 'true'
				ifTrue: [ self installTode2 ] ]
				on: Error
				do: [ :ex | self exitFailure: ex description ] ].
	self exitSuccess