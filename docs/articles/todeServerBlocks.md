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

##**THIN CLIENT**

