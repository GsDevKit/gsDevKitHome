Transcript
  cr;
  show: '-----Upgrading GLASS1 to most recent master version'.
GsDeployer bulkMigrate: [
  Metacello new
    baseline: 'GLASS1';
    repository: 'github://glassdb/glass:master/repository';
    get.
  Metacello new
    baseline: 'GLASS1';
    repository: 'github://glassdb/glass:master/repository';
    onConflict: [ :ex | ex allow ];
    load: 'default'.
  ].
