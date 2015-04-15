# GsDevKit Server Blocks
A *GsDevKit Server Block* is a `block` that is written in-line in client Smalltalk in Pharo, while the code in the `block` is executed on the server in GemSTone.
For example, the following code can be evaluated in a standard Pharo workspace while the `[ x + y ]` block is executed in a gem connected to the `devKit` stone:

```Smalltalk
| tdShell x y |
  tdShell := TDShell newOn: 'devKit'.
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
At first blush this may seem like a somewhat unremarkable capability until you realize that you can use *tODE Server Blocks* as a data base session from Pharo.

```Smalltalk
  | shell count min max resultIds selectedRecord rowId |
  shell := TDShell forStone: 'devKit'.	"define domain class on server"
  shell exportClassToServer: NeoCSVTestObject.
  count := 0.	"Load data from a csv file"
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
          shell
            onServerDo: [ 
              (Smalltalk
                at: #'NeoCSVData'
                ifAbsent: [ Smalltalk at: #'NeoCSVData' put: Dictionary new ])
                at: record x
                put: record ].
          count \\ 1000
            ifTrue: [ System commitTransaction ] ] ].	"query"
  min := 50000.
  max := 55000.
  resultIds := shell
    onServerDo: [ 
      | queryResults |
      queryResults := OrderedCollection new.
      (Smalltalk at: #'NeoCSVData')
        keysAndValuesDo: [ :key :value | 
          (value >= min and: [ value <= max ])
            ifTrue: [ queryResults add: key ] ].
      queryResults ].	"display selected record"
  rowId := resultIds atRandom.
  selectedRecord := shell
    onServerDo: [ (Smalltalk at: #'NeoCSVData') at: rowId ifAbsent: [ nil ] ].
  shell quit.
  selectedRecord
```

[1]: https://github.com/GsDevKit/ston#ston---smalltalk-object-notation
