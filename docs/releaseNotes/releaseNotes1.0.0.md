# Release Notes 1.0.0

Release notes for changes between [GsDevKitHome v0.0.1][4] and [GsDevKitHome v1.0.0][5]:
1. [$GS_HOME/tode structural changes](#gs_home-structural-changes)
   - [tode v0.0.2](#tode-v0.0.2)
   - [tode v0.0.3](#tode-v0.0.3)

##$GS_HOME/tode structural changes

###tODE v0.0.2
In [GsDevKitHome v0.0.1][4], `$GS_HOME/tode` housed a set of directories in support of [tODE v0.0.2][2]:

```
+-$GS_HOME\
  +-tode\
    +-client\
      +-descriptions\
      +-image\
      +-scripts\
      +-windowLayout\
    +-home\
      +-grease\
      +-gsDevKitHome\
      +-tode\
    +-server\
      +-scripts\
 ```

The `$GS_HOME/tode/client` directory housed a set of files meant to be accessed by the tODE Pharo client:
-  `$GS_HOME/client/descriptions`
   Session descriptions for each stone/
-  `$GS_HOME/client/image`
   Pharo client workspace doits
-  `$GS_HOME/client/scripts`
   tODE scripts meant to be invoked by client-side `builtIn` commands
-  `$GS_HOME/client/windowLayout`
   Pharo client window layout definitions.

The `$GS_HOME/tode/home` directory for disk-based storage and versioning of user tODE scripts and files. 
`$GS_HOME/tode/home` was typically mounted as the `/home` directory node and made it possible to share scripts and files between different stones.

The `$GS_HOME/tode/server/scripts` directory housed Smalltalk scripts for bootstrapping tODE into a fresh `extent0.seaside.dbf`. 
The scripts were also used for updating the tODE and GLASS1.

###tODE v0.0.3
In [tODE v0.0.3][3], the node structure has been enhanced to include a [`/sys` directory node][6]. 
To support the new `/sys` node structure in tODE, a `$GS_HOME/tode/sys` directory has been added: 

```
+-$GS_HOME\
  +-tode\
    +-sys\
      +-default\
        +-bin\
        +-client\
          +-scripts\
        +-home\
        +-logs\
        +-projects\
        +-server\
     +-local\
        +-client\
         +-scripts\
        +-home\
        +-logs\
        +-projects\
        +-server\
   +-stones\
     +-stones\
     +-templates\
```

Directory structure description...

###dev kit
###tode
1. set tode root
2. mount and setups scripts
3. tODE 0.0.3 release notes

## -branch arg to scripts

Consider an argument that allows alternate brancht o be used when loading tODE ... perhaps script components can be found in the tODE checkout?

[1]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.0.3.md
[2]: https://github.com/dalehenrich/tode/releases/tag/v0.0.2
[3]: https://github.com/dalehenrich/tode/releases/tag/v0.0.3
[4]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v0.0.1
[5]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v1.0.0
[6]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.0.3.md#sys-node-structure
