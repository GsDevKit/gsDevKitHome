# Pier 3.0.1

**Work in Progress**

Pier 3.0.1 is the latest version of Pier that is know to load into GemStone.
I've tested the following load steps in GemStone 3.1.0.6, but I expect them to work in later versions of GemStone.
The following tODE shell commands prepares tODE for loading Pier3.0.1 into your stone.

```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier
cd /home/pier/projects
cp magritte /sys/stone/projects
cp magritteAddOns /sys/stone/projects
cp pier3 /sys/stone/projects
cp pier3AddOns /sys/stone/projects
cp seaside /sys/stone/projects
cp zinc /sys/stone/projects
project refresh --locked  # make sure that 
```

The following tODE shell command initiates the load of Pier3.0.1.
The Pier3AddOns project is recommended for bringing up a usable Pier instance:

```
project load Pier3AddOns
```

**Stay tuned for further information about loading and using Pier in GemStone**
