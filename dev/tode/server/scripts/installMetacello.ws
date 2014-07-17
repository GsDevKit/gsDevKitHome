Transcript
  cr;
  show: '-----Upgrading Metacello to latest version on master branch'.
false ifTrue: [ 
  "Only needed if you use a non-standard repo for Metacello"
  GsDeployer bulkMigrate: [
    Metacello new
      baseline: 'Metacello';
      repository: 'filetree:///opt/git/metacello-work/repository';
      lock ].
  ].
