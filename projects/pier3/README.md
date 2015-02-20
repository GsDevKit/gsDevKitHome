# Pier 3.0.0

**Work in Progress**

Pier 3.0.0 is the latest version of Pier that is know to load into GemStone.
Pier 3.0.0 uses Seaside 3.0.
I've tested the following load steps in GemStone 3.1.0.6.

The following tODE shell commands prepares tODE for loading Pier3.0.0 into your stone.


```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier # mount the pier directory in tODE
cp /home/pier/projects300/magritte /sys/stone/projects        # use #stable from http://www.squeaksource.com/MetacelloRepository
cp /home/pier/projects300/magritteAddOns /sys/stone/projects  # use #stable from http://www.squeaksource.com/MetacelloRepository
cp /home/pier/projects300/pier3 /sys/stone/projects           # use #stable from http://www.squeaksource.com/MetacelloRepository
cp /home/pier/projects300/pier3AddOns /sys/stone/projects     # use #stable from http://www.squeaksource.com/MetacelloRepository
cp /home/pier/projects300/seaside /sys/stone/projects         # Use #release3.0
project refresh --locked                                      # ensure that new project entries are used
```

The following tODE shell command initiates the load of Pier3.0.0.
The Pier3AddOns project is recommended for bringing up a usable Pier instance and the Seaside3 load expression brings in the FastCGI and Swazoo adaptors:

```
project load Pier3AddOns # Pier3AddOns will load Pier, Magritte and Seaside
project load Seaside3    # Load Seaside adaptors and examples
bu backup pier3.0.0.dbf  # make a backup
project list             # refresh project list
```

To run a swazoo web server for Pier:

```
/home/pier/webServer --register=swazoo --port=8383 --start
/home/pier/webServer --register=swazoo --port=8383 --stop
/home/pier/webServer --register=swazoo --port=8383 --restart
```

**Stay tuned for further information about loading and using Pier in GemStone**
