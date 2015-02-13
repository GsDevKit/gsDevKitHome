# GsDevKit prerequisites for Ubuntu 14.04 

3. [ssh](#ssh)
1. [Basic prerequisites](#basic-prerequisites)
2. [X Server](#x-server)

##ssh
I recommend that you start by [installing ssh][2] on your server.
Besides making it possible to use to use [X11 forwarding][1], it makes life working on your server much easier being able to use `ssh` for access and `scp` for moving files back an forth.
Keep in mind that `ssh` is not required, so read up on the web about [best practices using ssh][4] before installing:

```
sudo apt-get -y update
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server
```

If you have installed `ssh`, you can log into your server with `ssh` and continue with the installation steps.

##Basic prerequisites

The following packages must be installed for GsDevKit and tODE to function:

```
sudo apt-get -y update
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install libpam0g:i386
sudo apt-get -y install libssl1.0.0:386
sudo apt-get -y install libssl1.0.0:i386
sudo apt-get -y install -qq gcc-multilib libstdc++6:i386
sudo ln -s /usr/lib/i386-lin-gnu/libstdc++.so.6 /usr/lib/i386-linux-gnu/libstdc++.so
```

##X Server
If you want run the Pharo client on the box or use [X11 forwarding][1] with `ssh`, then you need to install **X**:

```
sudo apt-get -y update
sudo apt-get -y install libx11-6:i386
sudo apt-get -y install libgl1-mesa-dev:i386
sudo apt-get -y install libxcb-dri2-0:i386
```

[1]: http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine
[2]: https://help.ubuntu.com/14.04/serverguide/openssh-server.html
[4]: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

