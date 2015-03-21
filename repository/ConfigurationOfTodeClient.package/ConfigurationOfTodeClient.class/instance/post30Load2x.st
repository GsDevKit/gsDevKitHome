doits
post30Load2x
	| gsDevKitHome windowProperties |
	Smalltalk at: #TODE_CLIENT_INSTALLED ifPresent: [ ^ self ].
	gsDevKitHome := FileSystem workingDirectory parent.
	Deprecation
		showWarning: false;
		raiseWarning: false.
	World closeAllWindowsDiscardingChanges.	"close all windows"
	(Smalltalk at: #TDShell) perform: #devKitRoot: with: gsDevKitHome pathString.
	(Smalltalk at: #PolymorphSystemSettings)
		perform: #desktopLogoFileName:
		with: (gsDevKitHome / 'pharo' / 'GemTalkSystemsLogo.png') pathString.
	(Smalltalk at: #TaskbarMorph) perform: #showTaskbar: with: false.
	(Smalltalk at: #NECPreferences) perform: #enabled: with: false.
	windowProperties := (Smalltalk at: #TDAbstractWindowProperties) import: 'standard-small'.
	windowProperties installOn: (Smalltalk at: #TDTopezGemStoneClient).
	Smalltalk at: #TODE_CLIENT_INSTALLED put: true.
	(Smalltalk at: #TDShell) resetWorldMenu