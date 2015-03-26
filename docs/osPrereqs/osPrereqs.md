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

##Optional packages
I recommend that you install the two optional packages [SSH](#ssh) and [X11 Client](#x11-client).
If you are undecided, then please read the section on [Client/Server Configurations](#clientserver-configurations) to help you make up your mind.

###SSH
Platform-specific installation instructions:

- [ssh for Ubuntu 12.04][65]
- [ssh for Ubuntu 14.04][66]
- [ssh for OS X10.9][67]

###X11 Client
Platform-specific installation instructions:

- [X11 Client for Ubuntu 12.04][75]
- [X11 Client for Ubuntu 14.04][76]
- [X11 Client for OS X10.9][77]

##Client/Server Configurations
A [GemStone server][8] is made up of several different processes:

![object server][9]

In a GsDevKit installation the `Server Processes` in the diagram above are co-located on a single machine and I will use the term **stone** to refer to a the [GemStone server][8] processes.

The `Application` in the diagram above corresponds to a tODE client.

In general GemStone may be configured in 4 different ways:

1. [Stone, gem and application (tODE) running on same machine](#).

   ![local stone/gems][7]

2. [Stone and gem running on the same machine, application (tODE) running on second machine](#):

   ![gem process on server node][14]

3. [Stone running on one machine, gem and application (tODE) running on second machine](#):

   ![gem process on remote node][13]

4. Stone running on one machine, gem running on a second machine, and application (tODE) running on a third machine:

   ![gem process and application process on remote nodes][12]

   *Note: with the [Community Edition License][15], you are not permitted to use remote gem processes (configurations 4).*

####Stone, gem, tODE, and DISPLAY running on same machine
[tODE and stone on same node][11]. 
The GCI uses the loopback interface for communication.
#####X11 DISPLAY on same machine
The X11 DISPLAY uses the loopback interface for communication. 
#####X11 DISPLAY on second machine
The X11 DISPLAY uses the LAN (or WAN) for communication.
Depending on the network latency, a remote DISPLAY may not be practical unless you [set up and use X11 forwarding][16].
####Stone and gem running on the same machine, tODE and DISPLAY running on second machine
[tODE and stone on different nodes][2].
The GCI communication uses the LAN (or WAN) for communication.
Depending upon network latency and whether or not you are comfortable opening ports in your firewall to allow the gem to connect to the stone (not recommended), you should [set up and use ssh port forwarding][17] as a secure way to connect to a remote stone.

[1]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-GemBuilderforC-3.2.pdf
[2]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/3-Distributed.htm#88520
[3]: http://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-SysAdmin-3.2/2-Clients.htm#pgfId-83078

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
[16]: ../x11ForwardingForRemoteDisplays.md#x11-forwarding-for-remote-servers
[17]: ../portForwardingForRemoteLogins.md#using-port-forwarding-for-remote-gemstone-servers

[55]: ubuntu12.04.md
[56]: ubuntu14.04.md
[57]: OSX10.9.md

[65]: ubuntu12.04.md#install-ssh-optional
[66]: ubuntu14.04.md#install-ssh-optional
[67]: OSX10.9.md#install-ssh-optional

[75]: ubuntu12.04.md#install-x11-client-optional
[76]: ubuntu14.04.md#install-x11-client-optional
[77]: OSX10.9.md#install-x11-client-optional
