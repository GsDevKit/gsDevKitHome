#X11 Forwarding for Remote Servers

##Intro
As an alternative to running a tODE client on you local machine and then logging into a stone running on a remote server over the WAN, you can use [X11 forwarding][1].

For best performance use the [compression option for ssh][2].
In a nutshell log into the server using the options:

```
ssh -c arcfour,blowfish-cbc -XC
```

[1]: http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine
[2]: http://xmodulo.com/how-to-speed-up-x11-forwarding-in-ssh.html
