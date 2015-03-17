"First step in tODE installation process: upgrade GLASS (if necessary).
 Let GsUpgrader make the decisions."
Transcript cr; show: '---Step 1 of tODE bootstrap process: execute upgradeGlass.ws'.
[
  Transcript
    cr;
    show: '-----Upgrade GLASS using gsUpgrader'.
  Gofer new
    package: 'GsUpgrader-Core';
    url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
    load.
  (Smalltalk at: #GsUpgrader) upgradeGLASS.
  Object class 
    compile: 'bootstrapGsDevKitHandlingErrorsDuring: aBlock
  "This method will be removed at end of tODE bootstrap process.
   See $GS_HOME/tode/sys/default/server/scripts/upgradeGLASS.ws for more info"
  aBlock on: Error, Halt do: [:ex |
      Transcript
        cr;
        show: ''========>Server Stack: '', ex description printString;
        cr;
        show: (GsProcess stackReportToLevel: 500).
      Transcript
        cr;
        show: ''========>Client Stack: '';
        cr.
      ex pass ]' 
    classified: 'tODE bootstrapping'..
  System commitTransaction. ]
    on: Error, Halt do: [:ex |
      Transcript
        cr;
        show: '========>Server Stack: ', ex description printString;
        cr;
        show: (GsProcess stackReportToLevel: 500).
      Transcript
        cr;
        show: '========>Client Stack: ';
        cr.
      ex pass ].
