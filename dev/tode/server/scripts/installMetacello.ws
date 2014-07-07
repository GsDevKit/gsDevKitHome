Transcript
  cr;
  show: '-----Upgrading Metacello to latest version on master branch'.
GsDeployer bulkMigrate: [ 
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    get.
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    load: 'ALL' 
  ].
