#Upgrade to GLASS 1.0-beta.9.1
GLASS 1.0-beta.9.1 is the most recent standard release of GLASS. 
This release represents to most recent set of bugfixes for GLASS and corresponds to 
the release of [GemStone/S 3.2][1].
Unless otherwise noted, you should upgrade to 1.0-beta.9.1 before using projects that have
been ported to GemStone.

Use the following expression to upgrade to  GLASS 1.0-beta.9.1:

```Smalltalk
ConfigurationOfGLASS project updateProject.
GsDeployer
  deploy: [ (ConfigurationOfGLASS project version: '1.0-beta.9.1') load ].
```

[1]: http://gemtalksystems.com/index.php/news/version3-2/
