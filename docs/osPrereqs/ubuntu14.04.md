# GsDevKit prerequisites for Ubuntu 14.04 
It is recommended that you [Install ssh (optional)](#install-ssh-optional).
Besides the obvious advantages of secure remote logins and secure remote file copying, ssh gives you flexibility to:
  - run tODE locally and log into remote servers via **ssh port forwarding**
  - run tODE on remote server and host display on local X server via **ssh X11 forwarding**
  - use the osprereqs script to install the platform prerequisites

If you decide not to [run the script](#osPrereqs-bash-script), then following the manual instructions in each section:

3. [Install ssh (optional)](#install-ssh-optional)
   - [osPrereqs bash script](#osPrereqs-bash-script)
1. [Install Basic Prerequisites (required)](#install-basic-prerequisites-required)
2. [X11 forwarding](#install-x11-forwarding-optional)

##Install ssh (optional)
I recommend that you start by [installing ssh][2] on your server.
Besides making it possible to use to use [X11 forwarding][1], it makes life working on your server much easier being able to use `ssh` for access and `scp` for moving files back an forth.
Keep in mind that `ssh` is not required, so read up on the web about [best practices using ssh][4] before installing:

```
sudo apt-get -y update
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server
```

If you have installed `ssh`, you can log into your server with `ssh` and continue with the installation steps.

###osPrereqs bash script
If you have installed `ssh` and you've got a checkout of gsDevKit on your server, you can use scp to copy the [osPrereqs script][3] from your server to the Ubunutu 14.04 box and save copy and pasting.

The following script copys `osPrereqs`, logs into your vm and installs the [basic prerequisites](#install-basic-prerequisites) and the [X11 client](#install-x11-client):

```
scp $GS_HOME/bin/osPrereqs notroot@192.168.100.132:/home/notroot
ssh 192.168.100.132 -l notroot
./osPrereqs -X -o ubuntu14.04
```

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

##X11 forwardingIf you want run the Pharo client using [X11 forwarding][1] with `ssh`, then you need to install the **X11 client**:

```
sudo apt-get -y install libgl1-mesa-dev:i386
sudo apt-get -y install libxcb-dri2-0:i386
```

[1]: http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine
[2]: https://help.ubuntu.com/14.04/serverguide/openssh-server.html
[3]: ../../bin/osPrereqs
[4]: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html


