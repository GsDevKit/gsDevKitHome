# Release Notes 1.0.0

Release notes for changes between [GsDevKitHome v0.0.1][4] and [GsDevKitHome v1.0.0][5]:
1. [$GS_HOME/tode structural changes](#gs_home-structural-changes)

##$GS_HOME/tode structural changes

In [tODE v0.0.3][3], the directories: `client/`, `home/`, and `server/` under tODE:

```
+-$GS_HOME\
  +-tode\
    +-client\
      +-descriptions\
      +-image\
      +-scripts\
      +-windowLayout\
    +-home\
    +-server\
      +-scripts\
```

have been deprecated. 

Going forward, the tODE node structure has been enhanced to include a [`/sys` directory node][6]. 
To support the new `/sys` node structure in tODE, a `$GS_HOME/tode/sys` directory has been added: 

```
+-$GS_HOME\
  +-tode\
    +-sys\
      +-default\
        +-bin\
        +-client\
          +-scripts\
          +-windowLayout\
        +-home\
        +-projects\
        +-server\
          +-scripts\
      +-local\
        +-client\
          +-descriptions\
          +-scripts\
          +-windowLayout\
         +-home\
        +-projects\
        +-server\
          +-scripts\
      +-stones\
        +-stones\
          +-<stone-name>\
            +-home\
            +-projects\
        +-client\
          +-scripts\
          +-windowLayout\
        +-server\
          +-scripts\
        +-templates\
```

The old directory structure maps to the new directory structure as follows:
- `$GS_HOME/tode/client/descriptions` maps to `$GS_HOME/tode/sys/local/client/descriptions`.
- `$GS_HOME/tode/client/image` is not mapped.
- `$GS_HOME/tode/client/scripts` maps to `$GS_HOME/tode/sys/default/client/descriptions`
- `$GS_HOME/tode/client/windowLayout` maps to `$GS_HOME/tode/sys/default/client/descriptions`
- `$GS_HOME/tode/home` maps to `$GS_HOME/tode/sys/local/home`
- `$GS_HOME/tode/server/scripts` maps to `$GS_HOME/tode/sys/default/server/scripts`


###dev kit
###tode
1. set tode root
2. mount and setups scripts
3. tODE 0.0.3 release notes

## -branch arg to scripts

Consider an argument that allows alternate brancht o be used when loading tODE ... perhaps script components can be found in the tODE checkout?

[1]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.0.3.md
[3]: https://github.com/dalehenrich/tode/releases/tag/v0.0.3
[4]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v0.0.1
[5]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v1.0.0
[6]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.0.3.md#sys-node-structure
