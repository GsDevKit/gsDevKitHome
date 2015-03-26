# GsDevKit prerequisites for Ubuntu 14.04 

1. [Install Basic Prerequisites (required)](#install-basic-prerequisites-required)
3. [Install ssh (optional)](#install-ssh-optional)
4. [X11 Client (optional)](#install-x11-client-optional)
2. [osPrereqs Installation Script (optional)](#osPrereqs-installation-script-optional)

If you are undecided about whether or not you should install the optional packages, read the section on [Client/Server Configurations][1].

##Install Basic Prerequisites (required)

The following packages must be installed for GsDevKit and tODE to function:

```
sudo apt-get -y update
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install unzip
sudo apt-get -y install libpam0g:i386
sudo apt-get -y install libssl1.0.0:386
sudo apt-get -y install libssl1.0.0:i386
sudo apt-get -y install -qq gcc-multilib libstdc++6:i386
sudo ln -s /usr/lib/i386-lin-gnu/libstdc++.so.6 /usr/lib/i386-linux-gnu/libstdc++.so
sudo apt-get -y install gdb
sudo apt-get -y install libfreetype6:i386
sudo apt-get -y install pstack
sudo /bin/su -c "echo 'kernel.yama.ptrace_scope = 0' >>/etc/sysctl.d/10-ptrace.conf"
```

##Install ssh (optional)
Before installing [ssh][2] on your server, read up on the web about [best practices using ssh][4].

```
sudo apt-get -y update
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server
```

##Install X11 Client (optional)

```
sudo apt-get -y install libgl1-mesa-dev:i386
sudo apt-get -y install libxcb-dri2-0:i386
```

###osPrereqs Installation Script (optional)
The [osPreregs script][3] is a bash script that can be used to install the prerequisites (including optional packages).

[1]: osPrereqs.md#clientserver-configurations
[2]: https://help.ubuntu.com/14.04/serverguide/openssh-server.html
[3]: ../../bin/osPrereqs
[4]: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

