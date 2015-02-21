[ 
  "Tests pharo todeLoad.st"
  | gs_home metacello |
  gs_home := Smalltalk os environment at: 'GS_HOME'.
  metacello := Metacello new
    configuration: 'TodeClient';
    version: #dev;
    repository: 'filetree://', gs_home, '/repository';
    yourself.
  metacello copy get. "cannot count on Pharo3.0 having latest Metacello loaded"
  metacello 
    onConflict: [:ex | ex disallow];
    load ]
      on: Warning
      do: [:ex | Transcript cr; show: ex description ].

