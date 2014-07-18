accessing
runShellCommand: shellCommandPath args: shellArgumentArray
	| out err proc outName |
	outName := '/tmp/gsdevkit.out'.
	out := FileStream forceNewFileNamed: outName.
	err := FileStream forceNewFileNamed: '/tmp/gsdevkit.err'.
	proc := OSProcess thisOSProcess
		forkJob: shellCommandPath
		arguments: shellArgumentArray
		environment: nil
		descriptors: (Array with: nil with: out with: err).
	proc ifNil: [ OSProcess noAccessorAvailable ].
	[ proc isRunning ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
	out close.
	err close.
	FileStream readOnlyFileNamed: outName do: [ :fileStream | ^ fileStream contents ]