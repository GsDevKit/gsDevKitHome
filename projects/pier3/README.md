# Pier 3.0.0

As of this writing Pier 3.1.1 is the most recent release of Pier, but this version of Pier has not been ported to Gemstone, yet.
Pier 3.0.0 is the latest version of Pier that is known to work in GemStone.
The Pier 3.0.0 project depends upon older versions of Magritte (Magritte 3.0), Seaside (Seaside 3.0.15), and XMLSupport (XMLSupport 1.2.2).

1. [Installation](#installation)
   - [Batch Install](#batch-install)
   - [tODE Install](#tode-install)
2. [Swazoo Seaside Server](#swazoo-seaside-server)

**Work in Progress**

Pier 3.0.0 is the latest version of Pier that is know to load into GemStone.
Pier 3.0.0 uses Seaside 3.0.
I've tested the following load steps in GemStone 3.1.0.6.

##Installation

###Batch Install

```
$GS_HOME/projects/pier3/bin/createPier3000Stone pier 3.2.4
```

```
$GS_HOME/projects/pier3/bin/installPier3000Ston pier
```


###tODE Install

```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier # mount the pier directory in tODE
install300                                                    # install Pier
```

##Swazoo Seaside Server
To run a swazoo web server for Pier:

```
/home/pier/webServer --register=swazoo --port=8383 --start
/home/pier/webServer --stop
/home/pier/webServer --restart
```

