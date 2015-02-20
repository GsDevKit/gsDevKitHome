[ 
  Metacello new
    configuration: 'TodeClient';
    version: #release;
    repository: 'filetree://$GS_HOME/repository';
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

