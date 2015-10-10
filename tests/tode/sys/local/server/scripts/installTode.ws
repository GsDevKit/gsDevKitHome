"Fourth and final step in tODE installation process: install tODE."
Transcript
  cr;
  show: '-----Upgrading tODE to latest 0.1.? branch version'.
GsDeployer bulkMigrate: [ 
  Metacello new
    baseline: 'Tode';
    repository: 'github://dalehenrich/tode:v0.1.?/repository';
    onConflict: [ :ex | ex allow ];
    get;
    load: 'GemStone Dev';
    lock ]
