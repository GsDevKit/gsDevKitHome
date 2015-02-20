# Release Notes 1.0.0

- [Bug Fixes](#bug-fixes)
- [Pull Requests](#pull-requests)
- [Project Loading](#project-loading)

##Bug Fixes
1. [Issue #22: ubuntu system requirements][10]
1. [Issue #32: structured handling of default/local/stone home and projects node][7]
2. [Issue #38: /sys/default/client/scripts/installServerTode2/ should be split out][8]
2. [Issue #40: setting PATH and GS_HOME could be a sh file rather than copy/paste][14]
2. [Issue #43: mention prominently that mono-spaced fonts should be used with tODE][18]
2. [Issue #45: More definitive `script is finished` needed for installServer and friends][13]
3. [Issue #45: More definitive `script is finished` needed for installServer and friends][11]
3. [Issue #48: `Do not clone as root` ...][12]
3. [Issue #58: 0.0.1 to 1.0.0 todo items][9]
4. [Issue #59: `/sys/stone/dirs` and `/sys/stone/repos` should be based on loaded projects only?][16]
4. [Issue #60: what's up with the `logs` entries in the `/sys` structure?][15]

##Pull Requests
1. [Pull Request #57: v1.0.0][17]

##Project Loading









---
---

Release notes for changes between [GsDevKitHome v0.0.1][4] and [GsDevKitHome v1.0.0][5]:
1. [$GS_HOME/tode structural changes](#gs_home-structural-changes)

##$GS_HOME/tode structural changes

In [tODE v0.1.0][3], the directories: `client/`, `home/`, and `server/` under tODE:

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
3. tODE 0.1.0 release notes

## -branch arg to scripts

Consider an argument that allows alternate brancht o be used when loading tODE ... perhaps script components can be found in the tODE checkout?

[1]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.1.0.md
[3]: https://github.com/dalehenrich/tode/releases/tag/v0.1.0
[4]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v0.0.1
[5]: https://github.com/GsDevKit/gsDevKitHome/releases/tag/v1.0.0
[6]: https://github.com/dalehenrich/tode/tree/master/docs/releaseNotes0.1.0.md#sys-node-structure
[7]: https://github.com/GsDevKit/gsDevKitHome/issues/32
[8]: https://github.com/GsDevKit/gsDevKitHome/issues/38
[9]: https://github.com/GsDevKit/gsDevKitHome/issues/58
[10]: https://github.com/GsDevKit/gsDevKitHome/issues/22
[11]: https://github.com/GsDevKit/gsDevKitHome/issues/45
[12]: https://github.com/GsDevKit/gsDevKitHome/issues/48
[13]: https://github.com/GsDevKit/gsDevKitHome/issues/45
[14]: https://github.com/GsDevKit/gsDevKitHome/issues/40
[15]: https://github.com/GsDevKit/gsDevKitHome/issues/60
[16]: https://github.com/GsDevKit/gsDevKitHome/issues/59
[17]: https://github.com/GsDevKit/gsDevKitHome/pull/57
[18]: https://github.com/GsDevKit/gsDevKitHome/pull/43
