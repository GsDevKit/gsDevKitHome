[ 
  "Master pharo todeLoad.st"
  | gs_home |
  gs_home := Smalltalk os environment at: 'GS_HOME'.
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    get.
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    onConflict: [:ex | ex allow];
    load.
  false ifTrue: [
    "To avoid GitHub API rate limits, edit and define github username/password in tode client image"
    "Change `false` to `true` execute this block"
    Smalltalk at: #MCGitHubRepository ifPresent: [:cls |
      cls
        siteUsername: '';
        sitePassword: ''] ].
  "If tODE is already loaded, clear github cache for baseline"
  Metacello image
    baseline: 'Tode';
    get.
  Metacello new
    configuration: 'TodeClient';
    version: #release;
    repository: 'filetree://', gs_home, '/repository';
    get;
    load ]
      on: Warning
      do: [:ex | 
        Transcript cr; show: ex description.
        ex resume ].

