"First step in tODE installation process: upgrade GLASS (if necessary).
 Let GsUpgrader make the decisions."
Transcript
  cr;
  show: '-----Upgrade GLASS using gsUpgrader'.
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGLASS.
