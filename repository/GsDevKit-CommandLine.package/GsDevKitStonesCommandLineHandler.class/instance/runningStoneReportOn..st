actions
runningStoneReportOn: stream
	| result |
	self gemstoneBin
		ifNil: [ 
			"no gemstone installations ergo no running stones"
			^ self ].
	stream
		nextPutAll: 'Running Stones:';
		lf.
	result := self runShellCommand: (self gemstoneBin / 'gslist') pathString args: #('-lc').
	(result beginsWith: 'gslist[Info]: No GemStone servers')
		ifTrue: [ ^ self ].
	(self runningStones values sorted: [ :a :b | a printString < b printString ])
		do: [ :info | 
			stream
				tab;
				nextPutAll: info printString;
				lf ]