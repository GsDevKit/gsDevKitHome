actions
copySeasideExtent: stoneDirectory
	| extentFile seasideExtentFile |
	seasideExtentFile := stoneDirectory / 'product' / 'bin' / 'extent0.seaside.dbf'.
	extentFile := stoneDirectory / 'extents' / 'extent0.dbf'.
	seasideExtentFile copyTo: extentFile.
	self stderr
		nextPutAll: (OSProcess command: 'chmod +w ' , extentFile pathString);
		lf