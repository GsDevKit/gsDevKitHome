# Open Source Development Kit for GemStone/S 64 Bit [![master branch:](https://travis-ci.org/GsDevKit/gsDevKitHome.png?branch=master)](https://travis-ci.org/GsDevKit/gsDevKitHome)

The Development Kit for GemStone/S features:

* [Simplified GemStone/S installation](#development-kit-server-installation).
  - [Operating System Prerequisites](#operating-system-prerequisites)
  - [Clone gsDevKitHome](#clone-gsdevkithome)
  - [Define gsDevKitHome Environment Variables](#define-gsdevkithome-environment-variables)
  - [Install a GemStone stone](#install-a-gemstone-stone)
  - [Open a tODE client image](#open-a-tode-client-image)
  - [Commit gsDevKitHome configuration changes to git](#commit-gsdevkithome-configuration-changes-to-git)

Additional supporting documentation:

* [Getting Started with tODE][62].
* [Featured GsDevKit projects][94].
* [GsDevKit projects][95].
* [Remote tODE Client installation][17].
* [Scripts for controlling stones][96].

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

For a full list of required/recommended packages plus installation instructions and scripts, see the  [GsDevKit Operating System Prerequisites][36].
   
###Clone gsDevKitHome
Clone the [gsDevKitHome project][2] to your GemStone development server and create a unique branch to keep any changes you make for your project isolated from the Dev Kit master branch:

```Shell
git clone git@github.com:GsDevKit/gsDevKitHome.git  # alternately use https://github.com/GsDevKit/gsDevKitHome.git
cd gsDevKitHome
git checkout -b  <your-project-branch-name>
```

See the documentation on [Git Credentials and tODE][97] for more information.

*Note, if you already have a [GitHub][15] account, you should consider [forking the Dev Kit project][3] first, as that will make sharing corrections you find much easier.*

###Define gsDevKitHome Environment Variables
Define the `$GS_HOME` environment variable and add `$GS_HOME/bin` to your `$PATH`:

```Shell
cd gsDevKitHome                # if you are not already located there
export GS_HOME=`pwd`
export PATH=$GS_HOME/bin:$PATH
```

It's a good idea to define `$GS_HOME` and `$PATH` in your `.bashrc` file.

###Install a GemStone stone
To install a GemStone stone, run the `$GS_HOME/bin/installServer` script.
This script performs the following individual steps.  
- installs GemStone and Pharo, if not already installed, using the [$GS_HOME/bin/installGemStone][34] script.
- builds a tODE client image, using the [$GS_HOME/bin/createTodeImage][59] script.
- creates a stone, using the [$GS_HOME/bin/createStone][60] script.
- starts the stone, using the [$GS_HOME/bin/startStone][31] script.
- starts the netldi, using the [$GS_HOME/bin/startNetldi][32] script.
- starts the statmonitor, using the [$GS_HOME/bin/startStatmonitor][61] script.
- installs tODE in the stone, using the [$GS_HOME/bin/installTodeStone][46] script.
- launches the Pharo tODE client, using the [$GS_HOME/bin/todeClient][35] script. 

Before running the `installServer` script, please check on the [GemStone/S 64 Bit product page for the latest versions][98] and visit [the Community and Web Edition Licensing page for information on the license included with the download and other options][98].
It is recommended that you download and use the latest version of the GemStone/S 64 Bit product.
The following creates a new stone named `devKit` based on [version 3.2.6 of GemStone/S][16]:

```Shell
installServer devKit 3.2.6
```
*Note that the script will prompt you for your password because it uses `sudo` to setup up your server for running GemStone*.

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
[36]: docs/osPrereqs/osPrereqs.md#gsdevkit-operating-system-prerequisites

[46]: bin/installTodeStone

[58]: http://gemtalksystems.com/products/vsd/
[59]: bin/createTodeImage
[60]: bin/createStone
[61]: bin/startStatmonitor
[62]: https://github.com/dalehenrich/tode/blob/master/docs/GettingStarted.md#getting-started-with-tode
[63]: docs/images/todeClient.png
[64]: https://github.com/dalehenrich/tode/blob/master/docs/GettingStarted.md#tode-test-login

[74]: tode/sys/default/projects
[75]: https://help.github.com/articles/using-pull-requests/
[76]: https://github.com/dalehenrich/tode/blob/master/docs/releaseNotes/releaseNotes0.1.0.md#project-entry

[94]: projects/README.md#featured-gsdevkit-projects
[95]: projects/README.md#gsdevkit-projects
[96]: bin/README.md
[97]: https://github.com/dalehenrich/tode/blob/master/docs/releaseNotes/releaseNotes0.1.0.md#git-credentials-and-tode
[98]: http://gemtalksystems.com/products/gs64/
[99]: http://gemtalksystems.com/licensing/#CWELicensing

