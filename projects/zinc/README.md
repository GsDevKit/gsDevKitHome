#GsDevKit Installation instructions for Zinc
The [Zinc][3] project is a fork of [Sven Van Caekenberghe's Zinc project][4]. 

Currently only the *Core* and *Tests* packages have been ported to GsDevKit:
* Zinc-HTTP
* Zinc-Tests
* Zinc-Character-Encoding-Core
* Zinc-Character-Encoding-Tests
* Zinc-Resource-Meta-Core
* Zinc-Resource-Meta-Tests

## Zinc 2.4.3 for GemStone 2.4 and 3.x [![Build Status](https://travis-ci.org/GsDevKit/zinc.png?branch=gs_master)](https://travis-ci.org/gs_master/zinc)
This is the version of Zinc that is currently recommended for use. 
This version of Zinc does depend upon GLASS1 for proper operation.

[Upgrade to GLASS 1.0-beta.9.3][1], then:
```Smalltalk
GsDeployer deploy: [
  Metacello new
    baseline: 'Zinc';
    repository: 'github://GsDevKit/zinc:gs_master/repository';
    load: 'Tests' ].
```

## Zinc 2.4.3 for GemStone 2.4 only [![Build Status](https://travis-ci.org/glassdb/zinc.png?branch=gemstone2.4)](https://travis-ci.org/glassdb/zinc)
This is the version that has been most heavily used, but 
[Zinc 2.4.3 for both GemStone 2.4.x and 3.x][5] has a number of bugfixes and stability 
improvements.

[Upgrade to GLASS 1.0-beta.9.1][2], then:
```Smalltalk
GsDeployer deploy: [
  Metacello new
    baseline: 'Zinc';
    repository: 'github://glass/glassdb:gemstone2.4/repository';
    load: 'Tests' ].
```

## Zinc 1.7 for GemStone 3.x only [![Build Status](https://travis-ci.org/glassdb/zinc.png?branch=gemstone3.1)](https://travis-ci.org/glassdb/zinc)
This version has some stability issues and using [Zinc 2.4.3][5] is higly recommended.

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
[3]: https://github.com/GsDevKit/zinc
[4]: https://github.com/svenvc/zinc
[5]: #zinc-243-for-gemstone-24-and-3x
