# Magritte 3.2.0 

```
mount @/sys/stone/dirs/gsDevKitHome/projects/magritt3 /home magritte
```

```
project load Magritte3      # load Magritte3 project
project load Seaside3       # load Seaside3 adaptors
bu backup magritte3.2.0.dbf # make a backup after load completes
project list                # refresh the project list
```

##Status
Current status is that there are 3 errors in the Magritte tests:

```
1726 run, 1723 passes, 0 expected defects, 0 failures, 3 errors, 0 unexpected passes
  1726 tests

MAMultipleOptionDescriptionTest>>#testOptionsAndLabels
MASingleOptionDescriptionTest>>#testOptionsAndLabels
MASingleOptionDescriptionTest>>#testOptionsAndLabelsToString
```
