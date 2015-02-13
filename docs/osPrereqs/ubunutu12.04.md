# GsDevKit prerequisites for Ubuntu 12.04 

3. [Install ssh (optional)](#install-ssh-optional)
1. [Install Basic Prerequisites (required)](#install-basic-prerequisites-required)
2. [Install X11 Client (optional)](#install-x11-client-optional)

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

If you have installed `ssh` and you've got a checkout of gsDevKit on your server, you can use scp to copy the [osPrereqs script][3] from your server to the Ubunutu 12.04 box and save copy and pasting.

The following script copys `osPrereqs`, logs into your vm and installs the [basic prerequisites](#install-basic-prerequisites) and the [X11 client](#install-x11-client):

```
scp $GS_HOME/bin/osPrereqs notroot@192.168.100.132:/home/notroot
ssh 192.168.100.132 -l notroot
./osPrereqs -X -o ubuntu12.04
```

##Install Basic Prerequisites (required)

The following packages must be installed for GsDevKit and tODE to function:

```
sudo apt-get -y update
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install unzip
sudo apt-get -y install libpam0g:i386
sudo apt-get -y install libssl1.0.0
sudo apt-get -y install libssl1.0.0:i386
sudo ln -s /lib/i386-linux-gnu/libpam.so.0 /lib/libpam.so.0
sudo apt-get -y install -qq gcc-multilib libstdc++6:i386
sudo ln -s /usr/lib/i386-lin-gnu/libstdc++.so.6 /usr/lib/i386-linux-gnu/libstdc++.so
```

##X11 Client (optional)
If you want run the Pharo client using [X11 forwarding][1] with `ssh`, then you need to install the **X11 client**:

```
sudo apt-get -y install libgl1-mesa-dev:i386
sudo apt-get -y install libxcb-dri2-0:i386
```

[1]: http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine
[2]: https://help.ubuntu.com/12.04/serverguide/openssh-server.html
[3]: ../../bin/osPrereqs
[4]: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

