##tODE Client Installation

tODE clients may be installed on Linux, Mac or Windows. 
If you are using Windows, please go to the separate [installation instructions for Windows][1] document.

Before installing tODE on a client, you should complete the [install of the Development Kit on a GemStone server][2].

1. Clone your fork of the [gsDevKitHome project][3] to your tODE client machine and checkout your project-specific branch:

   ```Shell
   git clone git@github.com:<your github id>/gsDevKitHome.git
   cd gsDevKitHome
   git checkout -b  <your branch name>
   ```

2. Define the `$GS_HOME` environment variable and add `$GS_HOME/bin` to your `$PATH`:

   ```Shell
   cd gsDevKitHome
   export GS_HOME=`pwd`
   export PATH=$GS_HOME/bin:$PATH
   ```

   It's a good idea to define `$GS_HOME` and `$PATH` in your `.bashrc` file.


3. Install GemStone/S (for GCI library files) and Pharo, build the tODE client image and launch the tODE client. The GemStone version that specify in the following should match the version(s) installed on your server machine:

   ```Shell
   installClient 3.2.1
   ```

4. Once the tODE client image comes up, you need to edit the session description for your stones using the `tODE edit` menu:

![edit description menu][4]

   Replace the name of the netldi with the port number of the netldi obtained from the [stones][6] command:

![description workspace][5]




[1]: windowsClientInstallation.md
[2]: ../README.md#development-kit-server-installation
[3]: https://github.com/GsDevKit/gsDevKitHome
[4]: images/editDescription.png
[5]: images/descriptionWorkspace.png
[6]: ../bin/stones
