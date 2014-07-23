# Open Source Development Kit for GemStone/S 64 Bit

This Development Kit for GemStone/S provides a framework for managing multiple GemStone stone instances across multiple machines.

The Development Kit provides a [set of scripts][5] for:
* Downloading [GemStone/S][6] and [Pharo][7].
* Building and maintaining the [tODE][8] development image.
* Creating new stone instances.
* Starting and stopping stones.

The [gemstone directory][10] has predefined locations for:
* [Download files][10].
* [GemStone/S product versions][11].
* [Stone instances][12].

The [pharo directory][14] contains an installation of Pharo3.0 that is used for the tODE client as well as for implementing a number of the Development Kit scripts. 

The [tode directory][13] provides an collection of tode scripts that are intended to be shared between your development and production servers. 

The Development Kit is intended to be [forked][1] and [cloned][4].
The fork serves two purposes:
   * The fork makes it very easy to contribute bugfixes and enhancements to the parent project.
   * The fork makes it easy for you to share your project specific artifacts (primarily tODE scripts) between your development and production servers.

##Development Kit Installation

1. [Fork][3] the [gsDevKitHome project][2] on [GitHub][15].
2. Clone your fork of the [gsDevKitHome project][2] to your GemStone development server and create a unique branch for your project-specific changes.
   Changes that you want to share with the community should be made on the master branch:

   ```Shell
   git clone git@github.com:<your github id>/gsDevKitHome.git
   cd gsDevKitHome
   git checkout -b  <your branch name>
   ```

3. Define the `$GS_HOME` environment variable and add `$GS_HOME/bin` to your `$PATH`:

   ```Shell
   cd gsDevKitHome
   export GS_HOME=`pwd`
   export PATH=$GS_HOME/bin:$PATH
   ```

   It's a good idea to define `$GS_HOME` and `$PATH` in your `.bashrc` file.
4. Install GemStone/S and Pharo, build the tODE client image, create a stone, start the stone, start the netldi, start the stamonitors, install tODE in stone and launch the tODE client. 
   The following creates a new stone named `tode` based on [version 3.2.1 of GemStone/S][16]:

   ```Shell
   installServer tode 3.2.1
   ```

   Note that the script will prompt you for your password because it uses sudo to setup up your server for running GemStone.
   When the script finishes, the tode client image is opened and you should be able to log into your stone using the test login tODE menu item.


5. Once you have verified that the session description is correct, you should commit the changes that you've made and push them to GitHub:

   ```Shell
   git status                          # to see what changes have been made
   git add --all                       # stage the changed files
   git commit -m"initial installation" # commit changes
   git push origin <your branch name>  # push the changes to GitHub
   ```

6. If you have a separate client machine separate from your development server, then follow the [client installation instructions][17].

[1]: https://help.github.com/articles/fork-a-repo
[2]: https://github.com/GsDevKit/gsDevKitHome
[3]: https://github.com/GsDevKit/gsDevKitHome/fork
[4]: https://help.github.com/articles/fork-a-repo#step-2-clone-your-fork
[5]: bin/README.md#gsdevkit-scripts
[6]: http://gemtalksystems.com/index.php/products/gemstones/
[7]: http://pharo.org/
[8]: https://github.com/dalehenrich/tode#tode-the-object-centric-development-environment-
[9]: gemstone/README.md
[10]: gemstone/downloads/README.md
[11]: gemstone/products/README.md
[12]: gemstone/stones/README.md
[13]: tode/README.md
[14]: pharo/README
[15]: https://github.com
[16]: http://gemtalksystems.com/index.php/news/version3-2/
[17]: docs/macLinuxClientInstallation.md

