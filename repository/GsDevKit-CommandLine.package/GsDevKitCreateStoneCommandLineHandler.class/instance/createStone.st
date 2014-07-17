actions
createStone
	| stoneDirectory |
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
	self exitSuccess