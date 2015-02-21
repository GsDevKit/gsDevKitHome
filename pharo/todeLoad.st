[ 
  "Master pharo todeLoad.st"
  | gs_home |
  gs_home := Smalltalk os environment at: 'GS_HOME'.
  Metacello new
    configuration: 'TodeClient';
    version: #release;
    repository: 'filetree://', gs_home, '/repository';
    get;
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

