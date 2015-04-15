# tODE Server Blocks
A *tODE Server Block* is a `block` that is written in-line in client Smalltalk in Pharo, while the code in the `block` is executed on the server in GemSTone.
For example, the following code can be evaluated in a standard Pharo workspace while the `[ x + y ]` block is executed in a gem connected to the `devKit` stone:

```Smalltalk
| tdShell x y |
  tdShell := TDShell newOn: 'devKit'.
  x := 3.
  y := 4.
  tdShell onServerDo: [ x + y ]
```

The current *tODE Server Block* implementation arranges to create variable bindings for the server derived from temp variables referenced in the block itself.
The variable binding Dictionary is serialized using [STON][1] and is sent to the server along with the source for the `block`.

On the server, the `block` source is compiled and evaluated with the proficed variable bindings Dictionary.
The result of the `block` evaluation is serialized using [STON][1] and returned to the client.

On the client, the result is reified and returned as the result of the `onServerDo:` message.

##THIN CLIENT
At first blush this may seem like a somewhat unremarkable capability until you realize that you can use *tODE Server Blocks* as a data base session from Pharo.

```Smalltalk
| shell |
shell := TDShell newOn: 'devKit'.
'NeoCSVBenchmark.csv' asFileReference readStreamDo: [ :stream | 
	| reader converter |
	converter := [ :string | NeoNumberParser parse: string ].
	reader := (NeoCSVReader on: (ZnBufferedReadStream on: stream)).
	reader
           recordClass: NeoCSVTestObject;
			addIntegerField: #x: ;
			addIntegerField: #y: ;
			addIntegerField: #z:.
	reader do: [:object | .
		shell onServerDo: [
			(Smalltalk at: #NeoCVSData 
				ifAbsent: [Smalltalk at: #NeoCVSData put: Array new]) add: object
	     ]] ]
```

[1]: https://github.com/GsDevKit/ston#ston---smalltalk-object-notation
