actions
copySeasideSystemConf: stoneDirectory
	| systemConfFile seasideSystemConfFile |
	seasideSystemConfFile := stoneDirectory / 'product' / 'seaside' / 'system.conf'.
	systemConfFile := stoneDirectory / 'extents' / 'system.conf'.
	seasideSystemConfFile copyTo: systemConfFile.
	OSProcess command: 'chmod +w ' , systemConfFile pathString