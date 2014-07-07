#Upgrade to GLASS 1.0-beta.9.3
GLASS 1.0-beta.9.3 bootstraps the [Metacello Preview][1] into your image.
The **Metacello Preview** contains the latest bugfixes to **Metacello** and is required
for the proper installation of GLASS1 either directly or indirectly via projects that 
have a direct dependency on GLASS1.

Use the following expression to upgrade to  GLASS 1.0-beta.9.3:

```Smalltalk
GsDeployer deploy: [
  | glassVersion |
  glassVersion := ConfigurationOfGLASS project currentVersion.
  glassVersion versionNumber < '1.0-beta.9.3' asMetacelloVersionNumber
    ifTrue: [
      Transcript
        cr;
        show: '-----Upgrading GLASS to 1.0-beta.9.3'.
      GsDeployer deploy: [
        Gofer new
          package: 'ConfigurationOfGLASS';
          url: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository';
          load.
        (((System stoneVersionAt: 'gsVersion') beginsWith: '2.') and: [glassVersion versionNumber < '1.0-beta.9.2' asMetacelloVersionNumber])
          ifTrue: [
            ((Smalltalk at: #ConfigurationOfGLASS) project version: '1.0-beta.9.2') load ].
        ((Smalltalk at: #ConfigurationOfGLASS) project version: '1.0-beta.9.3') load.
      ] ]
    ifFalse: [
      Transcript
        cr;
        show: '-----GLASS already upgraded to 1.0-beta.9.3' ] ].
```

[1]: https://github.com/dalehenrich/metacello-work#install-preview-version
