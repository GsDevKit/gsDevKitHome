# GsDevKit prerequisites for Ubuntu 12.04 

1. [Basic prerequisites](#basic-prerequisites)
2. [X Server](#x-server)
3. [sshd](#sshd)

NOTE: CONSIDER CREATING A BASH SCRIPT FOR THESE OPERATONS

##Basic prerequisites

The following packages must be installed for GsDevKit and tODE to function:

```
sudo apt-get -y update
sudo apt-get -y install git
sudo apt-get -y install unzip
sudo apt-get -y install libpam0g:i386
sudo apt-get -y install libssl1.0.0
sudo apt-get -y install libssl1.0.0:i386
sudo ln -s /lib/i386-linux-gnu/libpam.so.0 /lib/libpam.so.0
sudo apt-get -y install -qq gcc-multilib libstdc++6:i386
sudo ln -s /usr/lib/i386-lin-gnu/libstdc++.so.6 /usr/lib/i386-linux-gnu/libstdc++.so
```

##X Server
If you want run the Pharo client on the box then you need to install **X**:

```
sudo apt-get -y update
sudo apt-get -y install xorg
sudo apt-get -y install openbox
sudo apt-get -y install libx11-6:i386
sudo apt-get -y install libgl1-mesa-dev:i386
sudo apt-get -y install libxcb-dri2-0:i386
```

##sshd
An alternative to running an *X Server** is to use [X11 forwarding][1].
[Install ssh][2] on your box:

```
sudo apt-get -y update
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo chmod a-w /etc/ssh/sshd_config.original
```

[Edit the *sshd configuration*][3] (`vi /etc/ssh/sshd_config`):

1. Find and uncomment the following line:

   PubkeyAuthentication yes

2. Find and uncomment the following line:

   X11Forwarding Yes

```
sudo /etc/init.d/ssh restart
```

[1]: http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine
[2]: https://help.ubuntu.com/12.04/serverguide/openssh-server.html
[3]: http://itg.chem.indiana.edu/inc/wiki/software/openssh/200.html
