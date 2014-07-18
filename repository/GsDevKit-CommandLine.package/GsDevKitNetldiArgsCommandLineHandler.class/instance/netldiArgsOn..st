actions
netldiArgsOn: aStream
	| logDir |
	logDir := OSPlatform current environment getEnv: 'GEMSTONE_LOGDIR'.
	aStream nextPutAll: '-l ' , logDir , '/netldi.log '