"Second step in tODE installation process: lock Metacello if you want to use a non-standard repository.
 Install Metacello from local git clone."
Transcript cr; show: '---Step 2 of tODE bootstrap process: execute installMetacello.ws'.
Object bootstrapGsDevKitHandlingErrorsDuring: [
  "Uncomment and edit the following to lock the desired Metacello version/repository. 
   By default will let GsUpgrader install Metacello in Step 3 (installGLASS1.ws)."
  "
    Transcript cr; show: 'Locking Metacello: filetree:///opt/git/metacello-work/repository'.
    GsDeployer bulkMigrate: [
      Metacello new
        baseline: 'Metacello';
        repository: 'filetree:///opt/git/metacello-work/repository';
        lock ].
  "
  ].
