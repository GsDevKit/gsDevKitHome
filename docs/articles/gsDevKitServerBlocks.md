# GsDevKit Server Blocks
A *GsDevKit Server Block* is a `block` that is written in-line in client Smalltalk in Pharo, while the code in the `block` is executed on the server in GemStone.
For example, the following code can be evaluated in a standard Pharo workspace while the `[ x + y ]` block is executed in a gem connected to the `devKit` stone:

```Smalltalk
| tdShell x y |
  tdShell := TDShell forSessionNamed: 'devKit'.
  x := 3.
  y := 4.
  tdShell onServerDo: [ x + y ]
```

The current *GsDevKit Server Block* implementation arranges to create variable bindings for the server derived from temp variables referenced in the block itself.
The variable binding Dictionary is serialized using [STON][1] and is sent to the server along with the source for the `block`.

On the server, the `block` source is compiled and evaluated with the proficed variable bindings Dictionary.
The result of the `block` evaluation is serialized using [STON][1] and returned to the client.

On the client, the result is reified and returned as the result of the `onServerDo:` message.

##THIN CLIENT
At first blush this may seem like a somewhat unremarkable capability until you realize that you can use *GsDevKit Server Blocks* as a data base session from Pharo.

*Note: all of the following expressions should be executed in a standard Pharo workspace.*

1. Install NeoCSV in Pharo:
  ```Smalltalk

  Smalltalk at: #DevKitShell put: (TDShell forSessionNamed: 'devKit').
  Metacello new
    configuration: 'ConfigurationOfNeoCSV';
    version: #'stable';
    repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/';
    load.
  ```

2. Export domain class (NeoCSVTestObject) to GemStone:
  ```Smalltalk
  DevKitShell 
    exportClassToServer: NeoCSVTestObject;
    onServerDo: [ System commitTransaction ].
  ```

3. Create dummy domain data:
  ```Smalltalk
  | benchmark |
  benchmark := NeoCSVBenchmark new.
  benchmark cleanup.
  benchmark write3.
  ```

4. Initialize data store in GemStone:
  ```Smalltalk
  DevKitShell
    onServerDo: [ 
      UserGlobals
        at: #'NeoCSVDictionary'
        put: Dictionary new.
      System commitTransaction ]
  ```

5. Load domain data into GemStone from CSV file. Commit every 1000 records:
  ```Smalltalk
  | count |
  count := 0.
  'NeoCSVBenchmark.csv' asFileReference
    readStreamDo: [ :stream | 
      | reader converter |
      converter := [ :string | NeoNumberParser parse: string ].
      reader := NeoCSVReader on: (ZnBufferedReadStream on: stream).
      reader
        recordClass: NeoCSVTestObject;
        addIntegerField: #'x:';
        addIntegerField: #'y:';
        addIntegerField: #'z:'.
      reader
        do: [ :record | 
          count := count + 1.
          DevKitShell
            onServerDo: [ 
              NeoCSVDictionary
                at: record x
                put: record ].
          count \\ 1000 = 0
            ifTrue: [ System commitTransaction ] ] ].
   DevKitShell onServerDo: [ System commitTransaction ]
  ```

6. Do a Query on GemStone, store the query results on the server and return results size:
  ```Smalltalk
  | min max resultSize |
  min := 50000.
  max := 55000.
  resultSize := DevKitShell
    onServerDo: [ 
      | queryResults |
      queryResults := OrderedCollection new.
      NeoCSVDictionary
        keysAndValuesDo: [ :key :value | 
          (value >= min and: [ value <= max ])
            ifTrue: [ queryResults add: key ] ].
      UserGlobals at: #'NeoCSVQueryResults put: queryResults.
      System commitTransaction.
      queryResults size].
  Smalltalk at: #NeoQuerySize put: resultSize
  ```

7. View a specific record:
  ```Smalltalk
	
  | resultIndex selectedRecord |
  resultIndex := Collection randomForPicking integerBetween: 1 and: NeoQuerySize.
  selectedRecord := DevKitShell
    onServerDo: [  NeoCSVQueryResults at: resultIndex ].
  selectedRecord
  ```

8. Quit GemStone session:
  ```Smalltalk
  DevKitShell quit.
  ```

[1]: https://github.com/GsDevKit/ston#ston---smalltalk-object-notation
