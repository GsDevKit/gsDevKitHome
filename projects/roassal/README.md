# Roassal Visualizations
Right now, the support for [Roassal][2] visualization is based running client-side (Pharo) workspaces that use [server blocks][1].
Over time server-side tODE commands that use [Roassal][2] for visualization will be implemented.

## Installation
To use Roassal to visualize GemStone object graphs you need to install Roassal2 into the Pharo client: 

```
cp $GS_HOME/projects/roassal/tode/sys/local/pharo/todeLoad.st \
   $GS_HOME/tode/sys/local/pharo/
$GS_HOME/bin/updateTodeImage
```

##Example Visualizations
The following examples create a tODE session, evaluate the block on the server and then terminates the session:

```Smalltalk
"Evaulate a simple expression"
TDShell onServer: 'devkit' do: [ 3 + 4 ]. 
```

```Smalltalk
 "Bring up the tODE inspector"
TDShell onServer: 'devkit' do: [ 3 inspect ].
```


```Smalltalk
 "Bring up the tODE debugger"
TDShell onServer: 'devkit' do: [ 3 foo ].
```



[1]: ../../docs/articles/todeServerBlocks.md
[2]: http://objectprofile.com/Roassal.html

