accessing
runningStones
	runningStones
		ifNil: [ 
			runningStones := Dictionary new.
			self stonesHome directories
				do: [ :stoneDir | 
					(stoneDir filesMatching: self stoneInfoFilename)
						do: [ :infoFile | 
							| info |
							info := GsDevKitStoneInfo importFrom: infoFile.
							runningStones at: info stoneName put: info ] ] ].
	^ runningStones