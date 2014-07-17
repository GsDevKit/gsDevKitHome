actions
createEmptySubDirectories: stoneDirectory
	self subDirectories
		do: [ :dirName | 
			| dir |
			dir := stoneDirectory / dirName.
			dir exists
				ifTrue: [ 
					self stderr
						nextPutAll: dir pathString , ' already exists and is being skipped.';
						lf ]
				ifFalse: [ dir createDirectory ] ]