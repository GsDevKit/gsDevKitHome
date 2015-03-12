"Fourth and final step in tODE installation process: install tODE."
Transcript
  cr;
  show: '-----Upgrade tODE to latest 0.0.? tag'.
GsDeployer bulkMigrate: [ 
  Metacello new
    baseline: 'Tode';
    repository: 'github://dalehenrich/tode:0.0.?/repository';
    get;
    load: 'GemStone Dev' ]
