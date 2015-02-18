# Open Source Development Kit for GemStone/S 64 Bit [![master branch:](https://travis-ci.org/GsDevKit/gsDevKitHome.png?branch=master)](https://travis-ci.org/GsDevKit/gsDevKitHome)

The Development Kit for GemStone/S features:

* [Simplified GemStone/S installation](#development-kit-server-installation).
  - [Operating System Prerequisites](#operating-system-prerequisites)
  - [Clone gsDevKitHome](#clone-gsdevkithome)
  - [Define gsDevKitHome Environment Variables](#define-gsdevkithome-environment-variables)
  - [Install a GemStone stone](#install-a-gemstone-stone)
  - [Open a tODE client image](#open-a-tode-client-image)
  - [Commit gsDevKitHome configuration changes to git](#commit-gsdevkithome-configuration-changes-to-git)
* [tODE development environment][62]
* [GsDevKit projects](#gsdevkit-projects).
* [Remote tODE Client installation](#remote-tode-client-installation).
* [Scripts for controlling stones](#gemstones-management-scripts).

---
---

##Development Kit Server Installation

1. [Operating System Prerequisites](#operating-system-prerequisites)
2. [Clone gsDevKitHome](#clone-gsdevkithome)
3. [Define gsDevKitHome Environment Variables](#define-gsdevkithome-environment-variables)
4. [Install a GemStone stone](#install-a-gemstone-stone)
5. [Open a tODE client image](#open-a-tode-client-image)
   - [Open a tODE shell](#open-a-tode-shell)
   - [Open a tODE project list](#open-a-tode=project-list)
6. [Commit gsDevKitHome configuration changes to git](#commit-gsdevkithome-configuration-changes-to-git)

**NOTE:** *Do not use `sudo` when running any of the commands in this document, unless explicitly instructed to do so.*

###Operating System Prerequisites
The Dev Kit server can be installed on Linux or Mac OS X.
The following packages are required for GsDevKit:
- 32 bit libraries - needed to run Pharo (headless)
- curl             - needed by FileTree
- git              - needed by GsDevKit and tODE
- PAM              - needed by GemStone server
- ssl              - needed by GemStone server
- unzip            - needed by FileTree
- wget             - needed by bin/installGemStone script

The following packages are optional:
- X11              - needed to run [VSD][58] and Pharo (on Linux) with X11 forwarding (`ssh -X`)
- ssh              - needed to run Pharo with X11 forwarding and ease of access to server
 
If these packages are **NOT** already installed on your machine, then see the prerequisite installation guide for your platform:
- [GsDevKit prerequisites for Ubuntu 12.04][55]
- [GsDevKit prerequisites for Ubuntu 14.04][56]
- [GsDevKit prerequisites for OS X10.9][57]
   
###Clone gsDevKitHome
Clone the [gsDevKitHome project][2] to your GemStone development server and create a unique branch to keep any changes you make for your project isolated from the Dev Kit master branch:

```Shell
git clone https://github.com/GsDevKit/gsDevKitHome.git
cd gsDevKitHome
git checkout -b  <your project branch name>
```

*Note, if you already have a [GitHub][15] account, you should consider [forking the Dev Kit project][3] first, as that will make sharing corrections you find much easier.*

###Define gsDevKitHome Environment Variables
Define the `$GS_HOME` environment variable and add `$GS_HOME/bin` to your `$PATH`:

```Shell
cd gsDevKitHome
export GS_HOME=`pwd`
export PATH=$GS_HOME/bin:$PATH
```

It's a good idea to define `$GS_HOME` and `$PATH` in your `.bashrc` file.

###Install a GemStone stone
The `[$GS_HOME/bin/installServer` script: 
- installs GemStone and Pharo, if not already installed, using the [$GS_HOME/bin/installGemStone][34] script.
- builds a tODE client image, using the [$GS_HOME/bin/createTodeImage][59] script.
- creates a stone, using the [$GS_HOME/bin/createStone][60] script.
- starts the stone, using the [$GS_HOME/bin/startStone][31] script.
- starts the netldi, using the [$GS_HOME/bin/startNetldi][32] script.
- starts the statmonitor, using the [$GS_HOME/bin/startStatmonitor][61] script.
- installs tODE in the stone, using the [$GS_HOME/bin/installTodeStone][46] script.
- launches the Pharo tODE client, using the [$GS_HOME/bin/todeClient][35] script. 

The following creates a new stone named `devKit` based on [version 3.2.4 of GemStone/S][16]:

```Shell
installServer devKit 3.2.4
```
*Note that the script will prompt you for your password because it uses sudo to setup up your server for running GemStone*.

###Open a tODE client image
When the `installServer` script finishes, the tode client image is opened:

![tode image][63]

To manually open a tode client image, use the [$GS_HOME/bin/todeClient][35] script:

```
todeClient
```

####Open a tODE shell
Once a tode client image is open, use the following menu to open a tode shell:  
   
![open tode shell][18]

*If an error occurs while attempting to open the tODE shell, see the [tODE Test Login][64] section of the [Getting Started with tODE][62] document for getting help diagnosing the problem.*

####Open a tODE project list

Open a tODE a *Project List Browser* using the `project list` tODE command:

![project list][19]

For additional information on using tODE see the [Getting Started with tODE][62] document.

###Commit gsDevKitHome configuration changes to git
commit the changes that you've made.
(If you've forked the GitHub project, you should push the changes to your GitHub repository as well):

   ```Shell
   git status                          # see the changes that have been made
   git add --all                       # stage the changed files
   git commit -m"initial installation" # commit the changes
   ```

---
---

##GsDevKit Projects

Here is a sampling of some of the open source projects that have been ported to GemStone/S:

```
					pier.ston???
                                        ston.ston???
				
				
```

| Project | Description|
|---------|------------|
| Cryptography|[Squeak Cryptography Project][66]|
| Flow| [A living full-stack framework for the web][67]|
| Grease| [The Grease Portability Library][68]|
| gsApplicationTools| [Convenient setup of Gemstone server applications][69]|
| gsDevKitHome| [Open Source Development Kit for GemStone/S 64 Bit][70]|
| Magritte| [Dynamic Meta-Description Framework][21]   |
| Mapless| [Obscenely simple persistence for Smalltalk][71]|
| Metacello| [Package Management for Smalltalk][72]|
| NeoJSON | [An elegant and efficient standalone Smalltalk framework to read and write JSON ][73]|
| Pier ????|[A Content Management System][22] |
|[Seaside31][23]| [A Dynamic Web Development Framework][24] |
| SIXX| [Store and load Smalltalk objects in a portable, dialect-independent XML format][78]|
| STON ???| [A lightweight text-based, human-readable data interchange format for Smalltalk][77]|
| tODE| [the Object-centric Development Environment][79]|
|[ZincHTTPComponents][25]| [An open-source Smalltalk framework to deal with the HTTP networking protocol][26] |

These projects and others are registered by default in the [$GS_HOME/tode/sys/default/projects directory][74].
If you know of a project that has been ported to GemStone that is not included in the [*default projects directory*][74], please submit a [pull request][75] with a [project entry][76] for the project.

----

EDITTING REQUIRED

----
----

you can ensure that the projects will be loaded exactly the same way whether you use a shell script:

```Shell
$GS_HOME/projects/seaside31/loadProject devKit
```

or a tODE command:

```Shell
project load Seaside3
```

For more information about installing optional projects and a complete list of optional projects, visit the [GsDevKit Projects][27] page.

---
---

## Remote tODE Client Installation
The tODE Client can be installed on Linux, Mac OS X, or Windows.
See the [tODE client installation instructions][17] for details. 

---
---

##GemStone/S Management Scripts

* [stones](#stones)
* [createTodeStone](#createtodestone)
* [stopStone](#stopstone)
* [startStone](#startstone)
* [startNetldi](#startnetldi)

###stones
The [stones][33] script produces a report listing *Installed Products*, *Installed Stones*, *Running Stones*, and *Running Netldis*: 

```Shell
stones
```

Here's a sample report:

```
Installed Products:
	2.4.5.2
	3.0.1
	3.1.0.5
	3.1.0.6
	3.2.0
	3.2.1
Installed Stones:
	2.4.5.2	c_2452
	3.0.1	c_301
	3.1.0.5	c_3105
	3.2.1	gemtalk
	3.2.2	j_
	3.3.0	k_
	3.2.0	m_
Running Stones:
	Status       Version    Owner    Pid   Port   Started     Type       Name
	-------     --------- --------- ----- ----- ------------ ------      ----
	exists  3.2.0     dhenrich   2074 52832 Jul 22 10:36 Stone       m_
	exists  3.1.0.5   dhenrich   2450 46781 Jul 22 10:39 Stone       c_3105
	exists  2.4.5.2   dhenrich   2291 45711 Jul 22 10:37 Stone       c_2452
	exists  3.2.2     dhenrich   1980 43002 Jul 22 10:35 Stone       j_
	exists  3.0.1     dhenrich   2365 45327 Jul 22 10:38 Stone       c_301
	exists  3.2.1     dhenrich  18934 47480 Jul 24 10:25 Stone       gemtalk
Running Netldis:
	Status       Version    Owner    Pid   Port   Started     Type       Name
	-------     --------- --------- ----- ----- ------------ ------      ----
	exists  3.2.1     dhenrich  20901 49481 Jul 24 16:17 Netldi      gemtalk_ldi
	exists  3.2.0     dhenrich   2196 37538 Jul 22 10:36 Netldi      m_ldi
	exists  3.1.0.5   dhenrich   2514 38890 Jul 22 10:39 Netldi      c_ldi_3105
	exists  3.2.2     dhenrich   2048 44409 Jul 22 10:35 Netldi      j_ldi
	exists  3.0.1     dhenrich   2426 54616 Jul 22 10:38 Netldi      c_ldi_301
	exists  2.4.5.2   dhenrich   2340 54731 Jul 22 10:37 Netldi      c_ldi_2452
	exists  3.3.0     dhenrich   2274 33236 Jul 22 10:36 Netldi      k_ldi
```

###createTodeStone
The [createTodeStone][29] script creates a new stone of the given name and GemStone/S version:

```Shell
createTodeStone devKit 3.1.0.6
```

The stone is created in the `$GS_HOME/gemstone/stones` directory. 
After the stone is created, the stone and netldi processes are started and then tODE is installed.

*Note that the GemStone/S version must be previously installed using the [installGemStone][34] script*.

###stopStone
The [stopStone][30] script is used to stop a running stone by name:

```Shell
stopStone devKit
```

Use the [stones][33] script to get a list of the running stones.

###startStone
The [startStone][31] script is used to start a stone by name:

```Shell
startStone devKit 
```

###startNetldi
The [startNetldi][32] script is used to start a netldi for the given stone:

```Shell
startNetldi devKit
```

By default, the name of the netldi is constructed by tacking `_ldi` onto the name of the stone. 
If you want to use a different netldi name, edit the $GS_HOME/gemstone/stones/\<stone-name\>/info.ston file:

```
GsDevKitStoneInfo {
	#stoneName : 'devKit',
	#gsVers : '3.2.1',
	#username : nil,
	#netldiName : nil
}
```

---
---


[1]: https://help.github.com/articles/fork-a-repo
[2]: https://github.com/GsDevKit/gsDevKitHome
[3]: https://github.com/GsDevKit/gsDevKitHome/fork
[4]: https://help.github.com/articles/fork-a-repo#step-2-clone-your-fork
[5]: bin/README.md
[6]: http://gemtalksystems.com/index.php/products/gemstones/
[7]: http://pharo.org/
[8]: https://github.com/dalehenrich/tode#tode-the-object-centric-development-environment-
[9]: gemstone/README.md
[10]: gemstone/downloads
[11]: gemstone/products
[12]: gemstone/stones
[13]: tode
[14]: pharo
[15]: https://github.com
[16]: http://gemtalksystems.com/products/gs64/versions32x/
[17]: docs/clientInstallation.md#tode-client-installation
[18]: docs/images/openTodeShell.png
[19]: docs/images/projectList.png
[21]: https://code.google.com/p/magritte-metamodel/
[22]: http://www.piercms.com/
[23]: projects/seaside31
[24]: http://www.seaside.st/
[25]: projects/zinc
[26]: https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md#http
[27]: projects/README.md#gsdevkit-projects
[29]: bin/createTodeStone
[30]: bin/stopStone
[31]: bin/startStone
[32]: bin/startNetldi
[33]: bin/stones
[34]: bin/installGemStone
[35]: bin/todeClient
[46]: bin/installTodeStone
[55]: docs/osPrereqs/ubuntu12.04.md
[56]: docs/osPrereqs/ubuntu14.04.md
[57]: docs/osPrereqs/OSX10.9.md
[58]: http://gemtalksystems.com/products/vsd/
[59]: bin/createTodeImage
[60]: bin/createStone
[61]: bin/startStatmonitor
[62]: https://github.com/dalehenrich/tode/blob/master/docs/GettingStarted.md#getting-started-with-tode
[63]: docs/images/todeClient.png
[64]: https://github.com/dalehenrich/tode/blob/master/docs/GettingStarted.md#tode-test-login
[65]: https://github.com/dalehenrich/tode/blob/master/docs/releaseNotes/releaseNotes0.0.3.md#project-loading-with-tode
[66]: http://www.squeaksource.com/Cryptography.html
[67]: https://github.com/flow-stack/flow#flow
[68]: https://github.com/GsDevKit/Grease#the-grease-portability-library--
[69]: https://github.com/GsDevKit/gsApplicationTools#gsapplicationtools--
[70]: https://github.com/GsDevKit/gsDevKitHome#open-source-development-kit-for-gemstones-64-bit-
[71]: https://github.com/GsDevKit/Mapless#mapless
[72]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloUserGuide.md#metacello-user-guide
[73]: https://github.com/GsDevKit/NeoJSON#neojson-
[74]: tode/sys/default/projects
[75]: https://help.github.com/articles/using-pull-requests/
[76]: https://github.com/dalehenrich/tode/blob/master/docs/releaseNotes/releaseNotes0.0.3.md#project-entry
[77]: https://github.com/GsDevKit/ston#ston---smalltalk-object-notation
[78]: https://github.com/glassdb/SIXX#sixx-
[79]: https://github.com/dalehenrich/tode#tode-the-object-centric-development-environment-
