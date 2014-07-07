#GsDevKit Installation instructions for Zinc

## Zinc 2.4.3 for GemStone 2.4 and 3.x
[Upgrade to GLASS 1.0-beta.9.3][1], then:

```Smalltalk
GsDeployer deploy: [
  Metacello new
    baseline: 'Zinc';
    repository: 'github://GsDevKit/zinc:gs_master/repository';
    load: 'Tests' ].
```

## Zinc 2.4.3 for GemStone 2.4 only

[Upgrade to GLASS 1.0-beta.9.1][2], then:

```Smalltalk
GsDeployer deploy: [
  Metacello new
    baseline: 'Zinc';
    repository: 'github://glass/glassdb:gemstone2.4/repository';
    load: 'Tests' ].
```

## Zinc 1.7 for GemStone 3.x only

[Upgrade to GLASS 1.0-beta.9.1][2], then:

```Smalltalk
GsDeployer deploy: [
  Metacello new
    baseline: 'Zinc';
    repository: 'github://glass/glassdb:gemstone3.1/repository';
    load: 'Tests' ].
```


[1]: ../glass/upgradeTo1.0-beta9.3.md
[2]: ../glass/upgradeTo1.0-beta9.1.md
