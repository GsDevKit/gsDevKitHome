[ 
  "Load OSProcess, so we can resolve $GS_HOME"
  | gs_home |
  gs_home := Smalltalk os environment at: 'GS_HOME'.
  Metacello new
    configuration: 'TodeClient';
    version: #dev;
    repository: 'filetree://', gs_home, '/repository';
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

