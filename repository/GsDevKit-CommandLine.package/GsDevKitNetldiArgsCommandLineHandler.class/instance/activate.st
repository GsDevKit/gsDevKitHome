activation
activate
	| result |
	self activateHelp
		ifTrue: [ ^ self ].
	self arguments size < 1
		ifTrue: [ 
			self printHelp.
			^ self exitFailure: 'Missing arguments' ].
	result := self produceNetldiArgs.
	Exit signalSuccess: result