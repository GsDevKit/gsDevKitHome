actions
produceStoneReport
	"GsDevKitStonesCommandLineHandler new produceStoneReport"

	| stream |
	stream := WriteStream on: String new.
	installedStones := Dictionary new.
	self stonesHome directories
		do: [ :stoneDir | 
			(stoneDir filesMatching: self stoneInfoFilename)
				do: [ :infoFile | 
					| info |
					info := GsDevKitStoneInfo importFrom: infoFile.
					installedStones at: info stoneName put: info ] ].
	self
		installedStoneReportOn: stream;
		runningStoneReportOn: stream;
		yourself.
	^ stream contents