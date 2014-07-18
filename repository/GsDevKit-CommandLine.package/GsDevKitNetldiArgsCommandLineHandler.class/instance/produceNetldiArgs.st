actions
produceNetldiArgs
	| info netldiArgStream |
	info := GsDevKitStoneInfo importFrom: self stonesHome / self stoneName / self stoneInfoFilename.
	netldiArgStream := WriteStream on: String new.
	self netldiArgsOn: netldiArgStream.
	info netldiArgsOn: netldiArgStream.
	^ netldiArgStream contents