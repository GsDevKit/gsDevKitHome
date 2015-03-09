# Pier 3.0.0

Pier 3.0.0 is the latest version of [Pier][1] that is known to work in GsDevKit.
For best results you should install Pier 3.0.0 into a GemStone 3.1.0.6 stone and use the [Swazoo][2] web server.

1. [Installation](#installation)
3. [Getting Started with Pier](#getting-started-with-pier)
2. [Swazoo Seaside Server](#swazoo-seaside-server)


##Installation
If you are just getting started with GsDevKit, then you should use the following Bash shell scripts to create a Pier stone:


```
$GS_HOME/bin/installGemStone 3.1.0.6                        # Download GemStone 3.1.0.6
$GS_HOME/bin/createTodeImage                                # Create the tODE client image
$GS_HOME/projects/pier3/bin/createPier300Stone pier 3.1.0.6 # Create a pier stone
```

The [installGemStone][8] script GemStone 3.1.0.6 and only needs to be run if you haven't already installed 3.1.0.6.

The [createTodeImage][9] script creates the tODE client image and only needs to be run if you haven't run the [installServer][10] script before.

The `createPier300Stone` script:
- Creates a stone named `pier` based on GemStone 3.1.0.6, [starts the stone][11] and [starts a netLdi][12].
- Installs Pier3.0.0 and Seaside3.0.
- Creates a backup named `pier3.0.0.dbf`.
- Starts a [Swazoo web server](#swazoo-web-server).

See the [GsDevKit Server Scripts][13] for further information about the Bash commands that can be used to control the GemStone processes.

##Getting Started with Pier
Nic Ager's [demo of the Pier Administration interface][6] is a good introduction to [Pier][1].
When the script finishes running, you only need to do a few things to bring your Pier installation up to the point where the video starts.

Open a web browse and type in the following url `http://<server-host-name-or-ip-address>:8585/piersetup` to bring up the `Pier admin setup` screen:

![pier admin setup][3]

Click on the `New from template` tab to bring up a list of pre-defined Pier templates:

![pier blog template][4]

select the `Blog Template` and press the `Create kernel from template` button to bring up the `Create an admin user` screen:

![pier create admin user][14]

Fill in the `Name` and `Password` fields, press `Register admin user` and then press `ok` to create the site and bring up the `Customize blog Template` screen:

![pier customize blog template][7] 

Make sure that you click on the `add sample content` check box, then press the `Create kernel` button; answer `yes` to create `Pier Admin instance`; press`'ok` to `Continue to login`; and press the `Login` button to bring up the  `Blog Template` screen:

![pier blog template1][5]

[Nick Ager's video][6] will take you on a tour of the rest of Pier.

---
---

```
$GS_HOME/projects/pier3/bin/installPier300Ston pier
```

###tODE Script Install

```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier # mount the pier directory in tODE
install300                                                    # install Pier
```


##Swazoo Web Server
To run a Swazoo Seaside web server for Pier:

```
/home/pier/webServer --register=swazoo --port=8585 --start
/home/pier/webServer --stop
/home/pier/webServer --restart
```


[1]: http://www.piercms.com/
[2]: http://www.swazoo.org/
[3]: images/pier_admin_setup.png
[4]: images/pier_blog_template.png
[5]: images/pier_blog_template1.png
[6]: https://vimeo.com/32749535
[7]: images/pier_customize_blog_template.png
[8]: ../../bin/README.md#installGemStone
[9]: ../../bin/README.md#createTodeImage
[10]: ../../bin/README.md#installServer
[11]: ../../bin/README.md#startStone
[12]: ../../bin/README.md#startNetldi
[13]: ../../bin/README.md#server-scripts
[14]: images/pier_create_admin_user.png
