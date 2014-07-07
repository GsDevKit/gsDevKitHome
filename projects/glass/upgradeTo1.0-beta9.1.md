#Upgrade to GLASS 1.0-beta.9.1

```Smalltalk
ConfigurationOfGLASS project updateProject.
GsDeployer
  deploy: [ (ConfigurationOfGLASS project version: '1.0-beta.9.1') load ].
```
