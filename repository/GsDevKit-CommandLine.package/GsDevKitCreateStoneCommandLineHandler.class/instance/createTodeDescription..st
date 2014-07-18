actions
createTodeDescription: stoneInfo
	| sessionDescription |
	sessionDescription := TDSessionDescription new
		name: stoneInfo stoneName;
		gemstoneVersion: stoneInfo gsVers;
		stoneHost: 'localhost';
		stoneName: stoneInfo stoneName;
		gemHost: 'localhost';
		netLDI: stoneInfo netldiName;
		gemTask: 'gemnetobject';
		userId: 'DataCurator';
		password: 'swordfish';
		backupDirectory: '';
		serverGitRoot: self gitHome pathString;
		serverTodeRoot: self todeHome pathString;
		yourself.
	sessionDescription exportTo: self  sessionDescriptionHome pathString , '/'