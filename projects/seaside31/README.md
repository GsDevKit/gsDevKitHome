# Seaside31 [![gs_master branch:](https://travis-ci.org/GsDevKit/Seaside31.png?branch=gs_master)](https://travis-ci.org/GsDevKit/Seaside31)
The [GsDevKit Seaside31 project][3] is a fork of the [Seaside project][4].


## Register Project
If you using Seaside for the first time, then you should use the following project registration script:

```Shell
$GS_HOME/projects/seaside31/createProjectEntry <stone-name> Examples Zinc
```

Along with the basic development environment, you'll get a full complement of example components and the Zinc adaptor for running a web server.

If you are familiar with Seaside, then use the items from the Metacello `load:` message.

Ater installing Seaside (and an web server adaptor: Zinc, Swazoo, of FastCGI), you can use the [webServer tODE script](#webserver-script) for starting/stopping the chosen Seaside adaptor.


###Batch Install/Update
From the shell:

```Shell
$GS_HOME/projects/seaside31/loadProject <stone-name>
```

###Interactive Install/Update
Within tODE:

   * from tODE command line:


      ```Shell
      project load Seaside31
      ```

   * from tODE project list:

     ![project list menu][2]

You can change your project load list by using the `Browse >> project entry` menu from the `project list`:

![browse project entry][1]

to open a project entry editor:

![edit project entry][5]

For already loaded projects, only the load list will affect the project load.

###webServer script
Within tODE:

  ```Shell
  /home/seaside31/webServer --register=zinc --port=8383 --start
  ```

webServer script help text:

````
NAME
  webServer - start/stop/restart seaside web servers

SYNOPSIS
  webServer [-h|--help] [--register=zinc|fastcgi|swazoo] [--port=<port-number>]
  webServer [--start] [--stop] [--restart]

DESCRIPTION
  First register the type of web server that you want to use along with a port
  number (multiple port numbers not supported ...yet).

  Then start/start/stop the web server as desired.

EXAMPLES
  ./webServer --help
  ./webServer --register=zinc --port=8383 --start

  ./webServer --restart
  ./webServer --start
  ./webServer --stop

  NOTE - use the `tode it` menu item to run the examples directly from this window.
```

[1]: ../../docs/images/browseProjectEntry.png
[2]: ../../docs/images/projectListMenu.png
[3]: https://github.com/GsDevKit/Seaside31
[4]: http://seaside.st/
[5]: ../../docs/images/editProjectEntry.png

