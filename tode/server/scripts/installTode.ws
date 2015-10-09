"Fourth and final step in tODE installation process: install tODE."
Transcript
  cr;
  show: '-----Upgrading tODE to latest 0.0.4 tag'.
GsDeployer bulkMigrate: [ 
  Metacello new
    baseline: 'Tode';
    repository: 'github://dalehenrich/tode:v0.0.4/repository';
    get.
  Metacello new
    baseline: 'Tode';
    repository: 'github://dalehenrich/tode:v0.0.4/repository';
    onConflict: [ :ex | ex allow ];
    load: 'GemStone Dev' ].
