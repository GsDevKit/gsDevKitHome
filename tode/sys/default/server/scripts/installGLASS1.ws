"Third step in tODE installation process: install GLASS1.
 Let GsUpgrader do the installation."
Transcript cr; show: '---Step 3 of tODE bootstrap process: execute installGLASS1.ws'.
Object bootstrapGsDevKitHandlingErrorsDuring: [
  | monticelloDir gofer |
  Transcript
    cr;
    show: '-----Upgrade GLASS1 using gsUpgrader'.
  monticelloDir := ServerFileDirectory on: '$GS_HOME/tode/sys/local/monticello'.
  gofer := Gofer new
        package: 'GsUpgrader-Core';
        yourself.
  (monticelloDir fileNamesMatching: 'GsUpgrader-Core-*.mcz') size > 0
    ifTrue: [ 
      "local GsUpgrader-Core package"
      Transcript show: ' from $GS_HOME/tode/sys/local/monticello'.
      gofer repository: (MCDirectoryRepository new directory: monticelloDir) ]
    ifFalse: [ 
      "default repository"
      Transcript show: ' from http://ss3.gemtalksystems.com/ss/gsUpgrader'.
      gofer url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader' ].
  gofer load.
  (Smalltalk at: #'GsUpgrader') upgradeGLASS1 ].
