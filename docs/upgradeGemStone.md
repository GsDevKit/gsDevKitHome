#Upgrade GemStone

---

**READ THE INSTALL GUIDES for [Linux][1] or [Mac][2] FIRST**.

*Note: the links in this document point to the Linux GemStone documentation for [GemStone 3.2.6][6]. You should refer to the documentation for the platform and version of GemStone to which you are upgrading.*

---

##Table of Contents

---

1. [Introduction](#introduction)
2. [Before Upgrading](#before-upgrading)
   * [Package Naming Guidelines](#package-naming-guidelines)

3. [Upgrade Script](#upgrade-script)
   * [1. Copy extent and remove tranlog files](#1-copy-extent-and-remove-tranlog-files)
   * [2. Start stone](#2-start-stone)
   * [3. Run *upgradeImage* script](#3-run-upgradeimage-script)
   * [4. Execute *bootstrap-globals* topaz file](#4-execute-bootstrap-globals-topaz-file)
   * [5. Run *upgradeSeasideImage* script](#5-run-upgradeseasideimage-script)
   * [6. Execute *application-load* topaz file](#6-execute-application-load-topaz-file)

4. [Post Upgrade](#post-upgrade)
4. [Upgrade Error Diagnostics](#upgrade-error-diagnostics)
   * [Common *upgradeImage* Errors](#common-upgradeimage-errors)
   * [Common *upgradeSeasideImage* Errors](#common-upgradeseasideimage-errors)

   * [Interpretting *topazerrors.log* files](#interpretting-topazerrorslog-files)
   
---

##Introduction

---

**READ THE INSTALL GUIDES for [Linux][1] or [Mac][2] FIRST**. 

---

The upgrade process can get a little complicated, so I have created an
[upgradeGemStone script][3] that acts as a driver for the entire GsDevKitHome upgrade
process.

To perform an upgrade, you need to accomplish
three things:

1. Install the GemStone/S Core code base for the target GemStone version, which may include new
   **Global** methods and classes. The [upgradeGemStone script][3] covers:
   - The entire [Prepare for Upgrade section][7].
   - [Step 1][8] and [step 2][10] of the [Perform the Upgrade section][9].
   - [Step 3][11] and [step 4][12] of the [Perform the Upgrade section][9] need to be performed manually after the [upgradeGemStone script][3] is completed.
  
2. Install the GLASS/GsDevKit code base for the target GemStone version, which may include different sets of
   GsDevKit packages. The [upgradeGemStone script][3] covers the:

   - [Configure the GsDevKit Upgrade section][13] of [Upgrading GsDevKit Applications][15]
   - [Perform the Upgrade section][14] of [Upgrading GsDevKit Applications][15]


3. Install your application code, which may need to be
   different for the target GemStone version. The [upgradeGemStone script][3] covers the [Load your Application Code][16] section of [Upgrading GsDevKit Applicationsn][15]


##Before Upgrading

---

**READ THE INSTALL GUIDES for [Linux][1] or [Mac][2] FIRST**. 

---

As part of the upgrade process, you need to port your application code to
the target GemStone version and verify that the application code itself works well in
that version of GemStone.

If you are upgrading from GemStone 3.1.x the port may be no more
complicated than installing your application in a virgin seaside extent
and running your tests.

If you are upgrading from GemStone 2.x, the port may be more complicated
and you should pay special attention to the section entitled 
[Prior to Upgrade in existing application][18] in [Chapter 3][17] of the
Install Guides.

###Package Naming Guidelines

If you find that you do indeed have code changes that are specific to
the target version of GemStone, then you will need to decide on a re-packaging strategy. You can 
take one of two routes:

1. Create a package branch using the GemStone version number (`3.2` for example), where you simply make the necessary
   changes for `3.2` in-place and then save the Monticello package,
   with a branch name. The package named *MyApplication-Core* would be
   saved as *MyApplication-Core.v32* and your configuration baseline
   would look like the following:

   ```Smalltalk
   spec for: #'gemstone' do: [ 
     spec package: 'MyApplication-Core' ].
   spec for: #'gs3.2.x' do: [ 
     spec package: 'MyApplication-Core' with: [ spec file: 'MyApplication-Core.v32']
   ```

2. Separate the code into a common package, a `2.x` package, and a `3.2`
   package. The *MyApplication-Core* package would become the common package.
   The methods and classes that are unique to `2.x` would be be moved into
   a package named *MyApplication-2x-Core*. The methods and classes
   that are unique to `3.2` would be be moved into a package named  
   *MyApplication-32x-Core*. Your configuration baseline would be
   modified to look like the following:

   ```Smalltalk
   spec for: #'gemstone' do: [ 
     spec package: 'MyApplication-Core' ].
   spec
     for: #'gs2.4.x'
     do: [ 
       spec
         package: 'MyApplication-Core'
           with: [ spec includes: 'MyApplication-2x-Core' ];
         package: 'MyApplication-2x-Core'
           with: [ spec requires: 'MyApplication-Core' ] ].
   spec
     for: #'gs3.2.x'
     do: [ 
       spec
         package: 'MyApplication-Core'
           with: [ spec includes: 'MyApplication-32-Core' ];
         package: 'MyApplication-32-Core'
           with: [ spec requires: 'MyApplication-Core' ] ]
   ``` 

The first approach is appropriate if you will be moving your entire
development effort to GemStone 3.2 and most if not all code
modifications will take place in the 3.2 branch. It is relatively easy
to merge changes from *MyApplication-Core* to *MyApplication-Core.v32*,
but it is not quite as easy to merge changes from *MyApplication-Core.v32* 
back to *MyApplication-Core*.

The second approach is appropriate if you intend to continue development
for both GemStone `2.x` (or `3.1.x`) and GemStone `3.2` as it is much easier
to share the common code across multiple platforms, when merging
isn't required.

##Upgrade Script

---

**READ THE INSTALL GUIDES for [Linux][1] or [Mac][2] FIRST**. 

---

The [upgrade.sh script][3] automates the 6 main steps of the GemStone
upgrade process:

1. [Copy extent and remove tranlog files [**OPTIONAL**]](#1-copy-extent-and-remove-tranlog-files)
2. [Start stone](#2-start-stone)
3. [Run *upgradeImage* script](#3-run-upgradeimage-script)
4. [Execute *bootstrap-globals* topaz file](#4-execute-bootstrap-globals-topaz-file)
5. [Run *upgradeSeasideImage* script](#5-run-upgradeseasideimage-script)
6. [Execute *application-load* topaz file](#6-execute-application-load-topaz-file)

The script is provided as a template that you can customize to fit your
upgrade process requirements.

Before running this script, you should have [installed GemStone
3.2](../install/gettingStartedWithWebEdition.md) and use the
[defWebEdition source script](../../bin/defWebEdition) to define the
standard environment variables for the Web Edition.

In addition to the environment variables defined by *defWebEdition*, you
need to define the upgrade specific environment variable
**upgradeLogDir** that specifies the directory where the upgrade log
files will be located.

Finally the GemStone 3.2 stone should not be running when this script is
started.


---

### 1. Copy extent and remove tranlog files
The first step of the upgrade process is to copy the source extent file
(from GemStone 2.4.x or GemStone 3.1) into the $GEMSTONE_DATADIR and
make sure that there are no tranlog files left over from previous runs.

The location of the source extent is specified by the `-e` option:

```Shell
$WE_HOME/bin/upgrade.sh -C -e /opt/gemstone/3.1/product/seaside/data/extent0.dbf \
                        -a $WE_HOME/bin/upgrade/loadSeaside3.0.10.tpz \
                        -b $WE_HOME/bin/upgrade/bootstrapConfigurationOf
```

If you are copying the extent from the data dir of an old stone (as
above), make sure that the stone has been shut down cleanly.

If you omit the `-e` option when running the script no extent copy will
be performed and you are responsible for making sure that the proper
extent is present in the $GEMSTONE_DATADIR.

### 2. Start stone
Once the source extent is in place, the script starts the stone using
the stone name specified by the $GEMSTONE_NAME environment variable. The
stone is started with the following command:

```Shell
$GEMSTONE/bin/startstone $GEMSTONE_NAME
```

If the the `-C` option is present (specifying that the source extent is
from GemStone 2.4.x), then the stone is started as follows:

```Shell
$GEMSTONE/bin/startstone -C $GEMSTONE_NAME
```

After the stone is started, the script waits 5 minutes for the stone to
be ready for logins.

### 3. Run *upgradeImage* script
Once the stone has been started, the script runs *upgradeImage*
using the following command:

```Shell
$GEMSTONE/bin/upgradeImage -s $GEMSTONE_NAME
```
If there are errors during the exectuion of the script, 
the *topazerrors.log* file contains pointers to the error conditions. See 
[Interpretting topazerrors.log files](#interpretting-topazerrorslog-files)
for information about interpretting the contents of the *topazerrors.log*.

### 4. Execute *bootstrap-globals* topaz file

As described in the *Configure Seaside Upgrade* section of the 
**Installation Guides for [Linux][1] or [Mac][2]** there are a number of
**Bootstrap Globals**  that can be set to control the operation of the
*upgradeSeasideImage* script.

The original intent of the *upgradeSeasideImage* script was that it
would bootstrap the correct version of the ConfigurationOfGLASS (GLASS
1.0-beta.9.1 for GemStone 3.2) into the image as well as load the
correct version of your application. 

The script made the assumption
that it would be relatively straightforward to arrange to have all of
the mcz files used by your application located in a single
directory-based Monticello repository
(**BootstrapRepositoryDirectory**). With the increased usage of git-base 
repositories, this particular assumption is no longer valid.

[As pointed out by Pieter Nagel][4] in a discussion on the [GLASS mailing
list][5], it turns out that the
*upgradeSeasideImage* really only needs to bootstrap the code referenced
by **ConfigurationOfGLASS** and produce an upgraded version of the
*extent0.seaside.dbf* file.

To that end I have created a default [*bootstrap-globals*
file](../../bin/upgrade/bootstrapConfigurationOfGLASS1.0-beta.9.1.tpz) with the following
contents:

```Smalltalk
 UserGlobals
  at: #BootstrapRepositoryDirectory
  put: GsPackageLibrary getMonticelloRepositoryDirectory.
true
%
run
 UserGlobals
  at: #BootstrapApplicationLoadSpecs
  ifAbsent: [
    UserGlobals
      at: #BootstrapApplicationLoadSpecs
      put: {
        { 'ConfigurationOfGLASS' . '1.0-beta.9.1' . #('default') .
              BootstrapRepositoryDirectory } .
           }.
  ].
```

The above is the absolute minimum needed to correctly bootstrap GLASS
into an upgraded repository. 

The location of the *bootstrap-globals* file is specified by the `-b` option:

```Shell
$WE_HOME/bin/upgrade.sh -C -e /opt/gemstone/3.1/product/seaside/data/extent0.dbf \
                        -a $WE_HOME/bin/upgrade/loadSeaside3.0.10.tpz \
                        -b $WE_HOME/bin/upgrade/bootstrapConfigurationOf
```

### 5. Run *upgradeSeasideImage* script
Once the *bootstrap-globals* script has been run, the *upgradeSeaside* script is run using the following command:

```Shell
$GEMSTONE/seaside/bin/upgradeSeasideImage -s $GEMSTONE_NAME
```
If there are errors during the exectuion of the script, 
the *topazerrors.log* file contains pointers to the error conditions. See 
[Interpretting topazerrors.log files](#interpretting-topazerrorslog-files)
for information about interpretting the contents of the *topazerrors.log*.

### 6. Execute *application-load* topaz file
As the final operation in this script, the specified *application-load* topaz script
is executed. The *application-load* file is specified by the `-a` option:

```Shell
$WE_HOME/bin/upgrade.sh -C -e /opt/gemstone/3.1/product/seaside/data/extent0.dbf \
                        -a $WE_HOME/bin/upgrade/loadSeaside3.0.10.tpz \
                        -b $WE_HOME/bin/upgrade/bootstrapConfigurationOf
```

In the above example, the file [$WE_HOME/bin/upgrade/loadSeaside3.0.10.tpz](../../bin/upgrade/loadSeaside3.0.10.tpz)
is specified, but this file along with the other *load* files in the directory:

- [loadGLASS1.tpz](../../bin/upgrade/[loadGLASS1.tpz)
- [loadSeaside3.0.10.tpz](../../bin/upgrade/loadSeaside3.0.10.tpz)
- [loadSeaside3.1.0.tpz](../../bin/upgrade/loadSeaside3.1.0.tpz)

are simply example scripts. To create your own *application-load* file, you should take the topaz script
that you use to load your code into GemStone/S and modify it so that it will perform as an *application-load*
script. To do so, you need to add a **MCPerformPostloadNotification** handler to your load script and 
only allow the initialization of classes that are needed for the upgrade. The following code can be
used as a template:

```Smalltalk
| performInitialization |
performInitialization := #("names of class needing class initialization during upgrade").
[
"<...your application load code...>"
] on: MCPerformPostloadNotification do: [:ex |
           (performInitialization includes: ex postloadClass theNonMetaClass name)
             ifTrue: [
               "perform initialization"
               ex resume: true ]
             ifFalse: [
               GsFile gciLogServer: ' Skip ', ex postloadClass name asString, ' initialization.'.
                ex resume: false ] ] 
```

During the upgrade process, all of the methods are removed from your application classes, so during the load, 
*Monticello* will rerun **all** class initializations. Obviously, this can lead to all sorts of nasty problems.

99% of the classes do not need to have the class initaliazations run, however, every once in a while, you may 
find it necessary to run an #initialize method. If you look at the *upgradeSeasideImage* script there are a handful 
of classes that are explicitly initialized during upgrade.

If there are errors during the exectuion of the script, 
the *topazerrors.log* file contains pointers to the error conditions. See 
[Interpretting topazerrors.log files](#interpretting-topazerrorslog-files)
for information about interpretting the contents of the *topazerrors.log*.

## Post Upgrade
After the script has completed with no errors, you should continue following
the upgrade procedure outlined in the *Post-upgrade Application Code Modifications* 
sections in **Chapter 2. Upgrading from previous 
GemStone/S 64 Bit 3.x versions** or **Chapter 3. Converting from GemStone/S 64 Bit 2.4.xversions** of the
[Linux][1] or [Mac][2] **Install Guides**.

## Upgrade Error Diagnostics

### Common *upgradeImage* Errors
If an error occurs while running *upgradeImage*
it will more than likely require help from GemStone engineers to
diagnose the problem. 

Gather up the log files and package them in an email to the [GLASS mailing
list][5].

### Common *upgradeSeasideImage* Errors
The most common *upgradeSeasideImage* occurs when an mcz file is not
found in the **BootstrapRepositoryDirectory** (`$GEMSTONE/seaside/monticello/repository` by default):

```
GemStone: Error         Nonfatal
/export/foos2/users/dhenrich/3.0/n_gss64bit/fast50/gs/product/seaside/monticello/repository/Squeak.v32-dkh.300.mcz
Error Category: 231169 [GemStone] Number: 2023  Arg Count: 2 Context : 161248001 exception : 160875777
Arg 1: [160875521 sz:2 cls: 154832129 FSReference] /export/foos2/users/dhenrich/3.0/n_gss64bit/fast50/gs/product/seaside/monticello/repository/Squeak.v32-dkh.300.mcz
Arg 2: [20 sz:0 cls: 76289 UndefinedObject] nil
ERROR: UNEXPECTED ERROR
```

or

```
--transcript--'Fetched -> OmniBrowser-DaleHenrichs.447 --- foos:/export/foos2/users/dhenrich/3.0/n_gss64bit/fast50/gs/product/seaside/monticello/repository --- foos:/export/foos2/users/dhenrich/3.0/n_gss64bit/fast50/gs/product/seaside/monticello/repository'
--transcript--'...RETRY->OB-GemStone-Platform-dkh.69'
--transcript--'...RETRY->OB-GemStone-Platform-dkh.69'
--transcript--'...FAILED->OB-GemStone-Platform-dkh.69'
 -----------------------------------------------------
GemStone: Error         Nonfatal
a MetacelloPackageSpecResolutionError occurred (error 2710)
Error Category: 231169 [GemStone] Number: 2710  Arg Count: 4 Context : 161242113 exception : 176269057
Arg 1: [176269313 sz:12 cls: 113161729 MetacelloPackageSpec] aMetacelloPackageSpec
Arg 2: [176269569 sz:2 cls: 66817 Array] anArray
Arg 3: [20 sz:0 cls: 76289 UndefinedObject] nil
Arg 4: [20 sz:0 cls: 76289 UndefinedObject] nil
ERROR: UNEXPECTED ERROR
```

The best way to resolve the error is to find a copy of the missing mcz
file (*Squeak.v32-dkh.300.mcz* or *OB-GemStone-Platform-dkh.69*) and copy it into 
the **BootstrapRepositoryDirectory**. If you are
using the default location, you will need to make the directory
writable.

### Interpretting *topazerrors.log* files
If an error occurs while running a topaz script, a *topazerrors.log* is
created containing pointers to the line number of path to the topaz log
file. Here's an example *topazerrors.log* file:

```
near line 110 of file /export/foos2/users/dhenrich/3.0/n_gss64bit/upgrades/upgradeDir/topazApplication_1.out, ERROR: UNEXPECTED ERROR
topaz> time
 04/23/2014 14:10:46.634 PDT
```

It is worth noting that for the topaz upgrade scripts uses both the
`stk` and `stack` arguments for the `iferr` command:

```
iferr 1 stk
iferr 2 stack
```

The `stk` argument means that the stack trace is dumped to the log file
with a single line per frame (i.e., no argument or temp values) like the
following:

```
 ==> 1 MessageNotUnderstood >> defaultAction         @2 line 3   [methId 212055297]
 2 MessageNotUnderstood (AbstractException) >> _signalWith: @5 line 25   [methId 21212    0321]
 3 MessageNotUnderstood (AbstractException) >> signal @2 line 47   [methId 212123905]
 4 UndefinedObject (Object) >> doesNotUnderstand: @9 line 10   [methId 168907521]
 5 UndefinedObject (Object) >> _doesNotUnderstand:args:envId:reason: @7 line 12   [met    hId 168899073]
 6 [] in  ExecBlock0 (MetacelloScriptEngine) >> get @13 line 12   [methId 241598209]
 ...
```

The second `stack` argument means that after the `stk` display, a second
listing of the stack is dumped to the log file that includes arguments
and temp values:

```
==> 1 MessageNotUnderstood >> defaultAction         @2 line 3   [methId 212055297]
    receiver [246793217 sz:13 cls: 131073 MessageNotUnderstood] a MessageNotUnderstood occurred (error 2010), a UndefinedObject does not understand  #'project'
    result [20 sz:0 cls: 76289 UndefinedObject] nil 
(skipped 1 evaluationTemps)
2 MessageNotUnderstood (AbstractException) >> _signalWith: @5 line 25   [methId 212120321]
    receiver [246793217 sz:13 cls: 131073 MessageNotUnderstood] a MessageNotUnderstood occurred (error 2010), a UndefinedObject does not understand  #'project'
    inCextensionArg [20 sz:0 cls: 76289 UndefinedObject] nil 
    res [20 sz:0 cls: 76289 UndefinedObject] nil 
(skipped 1 evaluationTemps)
3 MessageNotUnderstood (AbstractException) >> signal @2 line 47   [methId 212123905]
    receiver [246793217 sz:13 cls: 131073 MessageNotUnderstood] a MessageNotUnderstood occurred (error 2010), a UndefinedObject does not understand  #'project'
4 UndefinedObject (Object) >> doesNotUnderstand: @9 line 10   [methId 168907521]
    receiver [20 sz:0 cls: 76289 UndefinedObject] nil 
    aMessageDescriptor [245338369 sz:2 cls: 66817 Array] anArray
    args [246792961 sz:0 cls: 66817 Array] anArray
    sel [19544065 sz:7 cls: 110849 Symbol] project
    ex [246793217 sz:13 cls: 131073 MessageNotUnderstood] a MessageNotUnderstood occurred (error 2010), a UndefinedObject does not understand  #'project'
(skipped 3 evaluationTemps)
5 UndefinedObject (Object) >> _doesNotUnderstand:args:envId:reason: @7 line 12   [methId 168899073]
    receiver [20 sz:0 cls: 76289 UndefinedObject] nil 
    aSymbol [19544065 sz:7 cls: 110849 Symbol] project
    anArray [246792961 sz:0 cls: 66817 Array] anArray
    aSmallInt [2 sz:0 cls: 74241 SmallInteger] 0 == 0x0 
    dnuKind [2 sz:0 cls: 74241 SmallInteger] 0 == 0x0 
6 [] in  ExecBlock0 (MetacelloScriptEngine) >> get @13 line 12   [methId 241598209]
    self [246720769 sz:3 cls: 28447233 MetacelloScriptEngine] aMetacelloScriptEngine
    receiver [246724097 sz:5 cls: 127745 ExecBlock0] anExecBlock0
    projectPackage [245259265 sz:12 cls: 20362241 MetacelloPackageSpec] aMetacelloPackageSpec
    spec [245255937 sz:13 cls: 28469249 MetacelloMCBaselineOfProjectSpec] aMetacelloMCBaselineOfProjectSpec
    self [246720769 sz:3 cls: 28447233 MetacelloScriptEngine] aMetacelloScriptEngine
    _VC [245274881 sz:5 cls: 134913 VariableContext] aVariableContext
```


[1]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/GS64-InstallGuide-Linux-3.2.6.htm
[2]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Mac-3.2.6/GS64-InstallGuide-Mac-3.2.6.htm
[3]: ../bin/upgradeGemStone
[4]: http://forum.world.st/Glass-Upgrade-GS-2-4-GS-3-1-when-GLASS-Seaside-etc-versions-have-already-diverged-tp4745943p4746183.html
[5]: http://lists.gemtalksystems.com/mailman/listinfo/glass
[6]: http://gemtalksystems.com/products/gs64/versions32x/#326
[7]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-1052936
[8]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-998508
[9]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-990954
[10]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-998565
[11]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-1051868
[12]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/2-Upgrade.htm#pgfId-1055060
[13]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/4-GsDevKit.htm#87400
[14]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/4-GsDevKit.htm#14654
[15]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/4-GsDevKit.htm#pgfId-1055984
[16]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/4-GsDevKit.htm#34464
[17]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/GS64-InstallGuide-Linux-3.2.6.htm
[18]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-InstallGuide-Linux-3.2.6/3-Conversion.htm#pgfId-1055431
