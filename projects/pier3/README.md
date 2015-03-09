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

The [createTodeImage][9] script creates the tODE client image and only needs to be run if you haven't run the [installServer][10] script.

The `createPier300Stone` script:
- Creates a stone named `pier` based on GemStone 3.1.0.6.
- Installs Pier3.0.0 and Seaside3.0.
- Creates a backup named `pier3.0.0.dbf`.
- Starst a [Swazoo web server](#swazoo-web-server).

##Getting Started with Pier
When the script finishes running, bring up a web browse and type in the following url `http://<server-host-name-or-ip-address>:8585/piersetup` and you should see the following screen:

![pier admin setup][3]

Click on the `New from template` tab, select the `Blog Template` and then press the `Create kernel from template` button at bottom of screen:

![pier blog template][4]

Fill out the `Create an admin user information` and press `Register admin user`; press `ok` to create the site, which brings us to the `Customize blog Template` screen:

![pier customize blog template][7] 

Click on the `add sample content` check box; press the `Create kernel` button (you can leave the other fields blank); answer `yes` to create `Pier Admin instance`; press`'ok` to `Continue to login`; and finally press the `Login` button:

![pier blog template1][5]

At this point you are ready to follow [Nic Ager's Demo of the Pier Administration interface video][6].

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
