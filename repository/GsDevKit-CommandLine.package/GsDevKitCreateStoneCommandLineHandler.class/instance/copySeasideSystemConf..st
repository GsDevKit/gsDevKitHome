actions
copySeasideSystemConf: stoneDirectory
	| systemConfFile seasideSystemConfFile |
	seasideSystemConfFile := stoneDirectory / 'product' / 'seaside' / 'system.conf'.
	systemConfFile := stoneDirectory / 'extents' / 'extent0.dbf'.
	seasideSystemConfFile copyTo: systemConfFile.
	self stderr
		nextPutAll: (OSProcess command: 'chmod +w ' , systemConfFile pathString);
		lf