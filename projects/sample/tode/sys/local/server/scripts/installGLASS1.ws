"Third step in tODE installation process: install GLASS1.
 Install GLASS1 from local git clone."
Transcript
  cr;
  show: 'Lock GLASS1: filetree:///opt/git/glass/repository'.
GsDeployer
   bulkMigrate: [ 
     Metacello new
       baseline: 'GLASS1';
       repository: 'filetree:///opt/git/glass/repository';
       lock ].
Transcript
    cr;
    show: '-----Upgrade GLASS1 using gsUpgrader'.
Gofer new
    package: 'GsUpgrader-Core';
    url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
    load.
(Smalltalk at: #'GsUpgrader') upgradeGLASS1.
