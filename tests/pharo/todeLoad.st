[ 
  Metacello new
    configuration: 'TodeClient';
    version: #dev;
    repository: 'filetree://$GS_HOME/repository';
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

