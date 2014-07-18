actions
createStone
	| stoneDirectory |
	Transcript
		cr;
		show: 'Creating stone ' , self stoneName.
	stoneDirectory := self stonesHome / self stoneName.
	stoneDirectory exists
		ifTrue: [ 
			self stderr
				nextPutAll: stoneDirectory pathString , ' already exists.';
				lf;
				nextPutAll: 'To replace it, remove or rename it and rerun this script';
				lf.
			self exitSuccess ].
	stoneDirectory createDirectory.
	self
		createProductLn: stoneDirectory;
		createEmptySubDirectories: stoneDirectory;
		copySeasideExtent: stoneDirectory;
		copySeasideSystemConf: stoneDirectory;
		copyTemplateFiles: stoneDirectory;
		yourself.
	(GsDevKitStoneInfo new
		stoneName: self stoneName;
		gsVers: self gsVers;
		yourself) exportTo: stoneDirectory / self stoneInfoFilename.
	Transcript
		cr;
		tab;
		show: 'Finished creating stone ' , self stoneName;
		cr.
	self exitSuccess