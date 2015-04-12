# Roassal Visualization
Right now, the support for [Roassal][2] visualization is based running client-side (Pharo) workspaces that use [server blocks][1].
Over time server-side tODE commands that use [Roassal][2] for visualization will be implemented.

## Installation
To use Roassal to visualize GemStone object graphs you need to install Roassal2 into the Pharo client: 

```
cp $GS_HOME/projects/roassal/tode/sys/local/pharo/todeLoad.st \
   $GS_HOME/tode/sys/local/pharo/
$GS_HOME/bin/updateTodeImage
```

##Examples
First you need to open a Roassal workspace associated with the session of your choice using the tODE menu:

![roassal tode menu][3]

The workspace variable `shell` is bound to an instance of **TDSHell** and you use the `onServerDo:` message to execute a block on the server:

![roassal tode workspace][4]

The `Tools` menu gives you access to the full tODE development environment:

![tode tools menu][5]

### `onServerDo:`
The following simple expressions should give you a feel for how to use the workspace and [server blocks][1]:

```Smalltalk
"Evaulate a simple expression"
shell onServerDo: [ 3 + 4 ]. 

"Bring up the tODE debugger"
shell onServerDo: [ 3 foo ].

"Bring up the tODE inspector"
shell onServerDo: [ (System stoneVersionReport at: 'gsVersion') inspect ].

"Bring up the Pharo inspector"
(shell onServerDo: [ System stoneVersionReport at: 'gsVersion' ]) inspect

"local temp variables referenced from block are passed to server"
| x y z |
x := 3.
y := 4.
z := shell onServerDo: [ x + y ].
z + 3
```

##Example Roassal Visualization

```Smalltalk
| res process resultProcessed builder |
 res := shell
    onServerDo: [ 
      | traversal array result |
      traversal := {nil}.
      result := OrderedCollection new.
      traversal
        at: 1
        put: [ :a :r | 
          | rtemp |
          a
            do: [ :e | 
              e isArray
                ifTrue: [ 
                  rtemp := OrderedCollection new.
                  r add: e asString -> rtemp -> rtemp asOop.
                  (traversal at: 1) value: e value: rtemp ]
                ifFalse: [ r add: e asString -> e asOop ] ] ].
      System commitTransaction.
      array := SystemRepository
        findAllReferencePathsToObjects: {#'TDStackFrame'}
        printToLog: false.
      (traversal at: 1) value: array value: result.
      result ].
  process := [ :r | 
  | resu |
  resu := Dictionary new.
  resu add: #'start' -> #'start' -> {}.
  r
    do: [ :o | 
      resu
        add:
          o key value first
            ->
              (o key value third key value collect: [ :a | a key value allButLast last ]).
      o key value third key value
        do: [ :a | 
          a key value allButLast reverse
            do: [ :aa | 
              | val |
              aa = a key value first
                ifTrue: [ val := #'start' -> #'start' ]
                ifFalse: [ val := a key value before: aa ].
              (resu includesKey: aa)
                ifTrue: [ (resu at: aa) add: val ]
                ifFalse: [ resu at: aa put: (Set with: val) ] ] ] ].
  resu ].
  resultProcessed := process value: res.
  builder := (Smalltalk at: #'RTExploraBuilder') new.
  builder shape circle
    size: 20;
    color: (Color blue alpha: 0.5);
    if: [ :cls | cls key = #'start' ] fillColor: (Color red alpha: 0.5);
    if: [ :cls | cls key = 'aGsNMethod' ] fillColor: (Color orange alpha: 0.5);
    if: [ :cls | cls key = 'aGsMethodDictionary' ]
      fillColor: (Color green alpha: 0.5).
  builder
    onLeftClickExplore: [ :c | (resultProcessed at: c) asArray ] edges: #'From';
    withPopup: [ :c | c ];
    dragChildren;
    node: resultProcessed keysSortedSafely second.
  builder open
```

[1]: ../../docs/articles/todeServerBlocks.md
[2]: http://objectprofile.com/Roassal.html
[3]: ../../docs/images/roassalMenu.png
[4]: ../../docs/images/roassalWorkspace.png
[5]: ../../docs/images/todeToolsMenu.png
