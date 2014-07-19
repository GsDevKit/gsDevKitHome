actions
installTode2
	| result |
	Transcript
		cr;
		show: 'installTode2[0] '.
	result := TDShell sessionDescription: self sessionDescription evaluate: 'script --script=installServerTode2'.
	Transcript
		cr;
		show: 'installTode2[1] : ' , result printString