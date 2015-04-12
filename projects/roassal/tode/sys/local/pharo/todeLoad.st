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
  Metacello new
    configuration: 'TodeClient';
    version: #release;
    repository: 'filetree://', gs_home, '/repository';
    get;
    load: #('Core' 'Visualize') ]
      on: Warning
      do: [:ex | 
        Transcript cr; show: ex description.
        ex resume ].

