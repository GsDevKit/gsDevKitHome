"Second step in tODE installation process: lock Metacello if you want to use a non-standard repository.
 Install Metacello from local git clone."
Transcript 
  cr; 
  show: 'Lock Metacello: filetree:///opt/git/metacello-work/repository'.
GsDeployer bulkMigrate: [
  Metacello new
    baseline: 'Metacello';
    repository: 'filetree:///opt/git/metacello-work/repository';
    lock ].
].
