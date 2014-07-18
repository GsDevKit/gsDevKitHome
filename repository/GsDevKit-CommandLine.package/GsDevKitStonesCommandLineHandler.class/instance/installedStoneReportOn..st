actions
installedStoneReportOn: stream
	stream
		nextPutAll: 'Installed Stones:';
		lf.
	(self installedStones values sorted: [ :a :b | a printString < b printString ])
		do: [ :info | 
			stream
				tab;
				nextPutAll: info printString;
				lf ]