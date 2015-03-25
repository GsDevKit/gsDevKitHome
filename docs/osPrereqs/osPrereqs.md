#Operating System Prerequisites

##Required packages
The GsDevKit server can be installed on Linux or Mac OS X.

The following packages are required for a GsDevKit installation:
- 32 bit libraries - needed to run Pharo (headless)
- curl             - needed by FileTree
- git              - needed by GsDevKit and tODE
- PAM              - needed by GemStone server
- ssl              - needed by GemStone server
- unzip            - needed by FileTree
- wget             - needed by bin/installGemStone script
- gdb, pstack      - needed by GemStone to produce C stack traces
- freetype         - needed by Pharo (headful) on Linux for using platform-specific (monospaced) fonts

See the the prerequisite installation guide for your platform for detailed instructions on installing the required prerequisites:
- [GsDevKit prerequisites for Ubuntu 12.04][55]
- [GsDevKit prerequisites for Ubuntu 14.04][56]
- [GsDevKit prerequisites for OS X10.9][57]

##Optional Packages
###Client/Server Configurations
A [GemStone server][8] is made up of several different processes:

![object server][9]

In a GsDevKit installation the `Server Processes` in the diagram above are co-located on a single machine and I will use the term **stone** to refer to a the [GemStone server][8] processes.

The `Application` in the diagram above corresponds to a tODE client.

In general GemStone may be configured in 4 different ways, all processes co-located on a single machine]:
1. [stone, gem and application (tODE) running on same machine][11].
2. stone and gem running on the same machine, application (tODE) running on second machine.

   ![gem process on server node][14]

3. stone running on one machine, gem and application (tODE) running on second machine.

   ![gem process on remote node][13]

4. stone runninin on one machine, gem running on a second machine, and application (tODE) running on a third machine.

   ![gem process and application process on remote nodes][12]

With the [Community Edition License][15], you are not permitted to run with remote gem processes (options 3 and 4).

The tODE client is written in Pharo and uses [GemBuilder for C][1] (GCI) for communicatine with the stone.


tODE runs as an [RPC application][3] and establishes a network connection to the stone by initally connecting to a well-known port on the [GemStone netldi process][5].




Basically you have three options:

1. [Local display, local stone, local tODED](#)
2. [Local display, remote stone, remote tODE](#)
3. [Remote display, local stone, local tODE](#)

####Local display, local stone, local tODE

![local stone/gems][7]

[Run tODE and stone on same node][4] where the GCI and X11 use the loopback interface for communication.

####Local display, remote stone, remote tODE

![local stone/gems][6]

[Run tODE and stone on same node][4] where the GCI uses the loopback interface for communication and X11 uses the local area network (or WAN) for communication between the X11 client and server (on remote client). 

####Remote display, local stone, local tODE

![local stone/gems][7]

[Run tODE and stone on different nodes][2] where the GCI communication uses the local area network (or WAN) and the tODE client uses the loopback interface (on remote client) for communication.


[1]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-GemBuilderforC-3.2.pdf
[2]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/3-Distributed.htm#88520
[3]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/2-Clients.htm#pgfId-83078
[4]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/2-Clients.htm#47882
[5]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/3-Distributed.htm#pgfId-82455
[6]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/3-Distributed-1.png
[7]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/2-Clients-1.png
[8]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/1-Server.htm#pgfId-1332187
[9]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/1-Server-1.png

[10]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/3-Distributed-3.png
[11]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/2-Clients.htm#pgfId-82959

[12]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/3-Distributed-8.png
[13]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/3-Distributed-7.png
[14]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/resources/3-Distributed-6.png

[15]: http://gemtalksystems.com/licensing/#CWELicensing
