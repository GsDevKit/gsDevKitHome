# Pier 3.0.0

**Work in Progress**

Pier 3.0.0 is the latest version of Pier that is know to load into GemStone.
Pier 3.0.0 uses Seaside 3.0.
I've tested the following load steps in GemStone 3.1.0.6, but I expect them to work in later versions of GemStone.

The following tODE shell commands prepares tODE for loading Pier3.0.0 into your stone.

```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier
cd /home/pier/projects300
cp magritte /sys/stone/projects
cp magritteAddOns /sys/stone/projects
cp pier3 /sys/stone/projects
cp pier3AddOns /sys/stone/projects
cp seaside /sys/stone/projects
project refresh --locked
```

The following tODE shell command initiates the load of Pier3.0.0.
The Pier3AddOns project is recommended for bringing up a usable Pier instance and the Seaside3 load expression brings in the FastCGI and Swazoo adaptors:

```
project load Pier3AddOns
project load Seaside3
bu backup pier3.0.0.dbf
project list
```

To run a swazoo web server for Pier:

```
/home/pier/webServer --register=swazoo --port=8383 --start
/home/pier/webServer --register=swazoo --port=8383 --stop
/home/pier/webServer --register=swazoo --port=8383 --restart
```

**Stay tuned for further information about loading and using Pier in GemStone**
