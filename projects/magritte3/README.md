# Magritte 3.2.0 

```
mount @/sys/stone/dirs/gsDevKitHome/projects/magritte3 /home magritte # mount the magritte directory in tODE
cp /home/magritte/projects/zinc /sys/stone/projects                   # Use  Zinc 2.4.3.1 and get gem servers
```

```
project load Magritte3      # load Magritte3 project
project load Seaside3       # load Seaside3 adaptors
bu backup magritte3.2.0.dbf # make a backup after load completes
project list                # refresh the project list
```

-------------
commit the package to magritte project so that tests all pass
