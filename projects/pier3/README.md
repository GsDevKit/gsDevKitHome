# Pier 3.0.0

**Work in Progress**

Pier 3.0.0 is the latest version of Pier that is know to load into GemStone.
Pier 3.0.0 uses Seaside 3.0.
I've tested the following load steps in GemStone 3.1.0.6.

The following tODE shell commands installs Pier3.0.0 into your stone.


```
mount @/sys/stone/dirs/gsDevKitHome/projects/pier3 /home pier # mount the pier directory in tODE
install300
```

To run a swazoo web server for Pier:

```
/home/pier/webServer --register=swazoo --port=8383 --start
/home/pier/webServer --register=swazoo --port=8383 --stop
/home/pier/webServer --register=swazoo --port=8383 --restart
```

**Stay tuned for further information about loading and using Pier in GemStone**
