[ 
  "Load OSProcess, so we can resolve $GS_HOME"
  | gs_home |
  Metacello new
    configuration: 'OSProcess';
    version: #stable;
    repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
    load: 'Core'.
  gs_home := (Smalltalk at: #OSProcess) thisOSProcess environmentAt: #'GS_HOME'.
  Metacello new
    configuration: 'TodeClient';
    version: #release;
    repository: 'filetree://', gs_home, '/repository';
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

