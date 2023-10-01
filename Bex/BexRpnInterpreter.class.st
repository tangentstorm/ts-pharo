"
Interpreter for a small stack-based language that builds diagrams for boolean expressions.

"
Class {
	#name : #BexRpnInterpreter,
	#superclass : #Object,
	#instVars : [
		'base',
		'hi',
		'lo',
		'branchVar',
		'data',
		'ctrl',
		'defs',
		'ip',
		'toks',
		'ctx',
		'announcer'
	],
	#category : #'Bex-RPN'
}

{ #category : #ops }
BexRpnInterpreter >> and [
  ^ self binOp: #and
]

{ #category : #accessing }
BexRpnInterpreter >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexRpnInterpreter >> binOp: aSymbol [
  | x y |
  y := data pop. x := data pop.
  ^ self push: (base op: aSymbol x: x y: y)
]

{ #category : #ops }
BexRpnInterpreter >> br0 [
  self branch: #x0
]

{ #category : #ops }
BexRpnInterpreter >> br1 [
  self branch: #x1
]

{ #category : #ops }
BexRpnInterpreter >> br2 [
  self branch: #x2
]

{ #category : #ops }
BexRpnInterpreter >> br3 [
  self branch: #x3
]

{ #category : #ops }
BexRpnInterpreter >> br4 [
  self branch: #x4
]

{ #category : #accessing }
BexRpnInterpreter >> branch: varSymbol [
  | o e |
  branchVar := varSymbol.
  hi := data pop. lo := data pop.
  o := base op: varSymbol x: lo y: hi.
  o cornerRadius: 25.
  e := o userData at: #incoming.
  e first gsStrokeStyle: #dashed; dstMarker: #none.
  e second gsStrokeStyle: #solid; dstMarker: #none.
  ^ self push: o
]

{ #category : #accessing }
BexRpnInterpreter >> currentTokens [
  ^ toks
]

{ #category : #accessing }
BexRpnInterpreter >> defs [
  ^ defs
]

{ #category : #execution }
BexRpnInterpreter >> doToken: aSymbol [
  defs at: aSymbol
    ifPresent: [:def | ctrl push: { ip. ctx }. 
      "set ip to zero because we're called from step, which increments it."
      ctx :=  aSymbol. ip := 0. toks := def. 
      self frameChanged]
    ifAbsent: [ self perform: aSymbol ]
]

{ #category : #ops }
BexRpnInterpreter >> dup [
  self push: base dup.
]

{ #category : #events }
BexRpnInterpreter >> frameChanged [
  announcer announce: (BexStackFrameChangedEvent new ip: ip)
]

{ #category : #ops }
BexRpnInterpreter >> i [
  self push: base i
]

{ #category : #ops }
BexRpnInterpreter >> initialCtx [
  ^ #'(top)'
]

{ #category : #accessing }
BexRpnInterpreter >> initialize [
  super initialize.
  "make ourselves observable to BexDebuggerPanel"
  announcer := Announcer new.
  "the base builds the actual data structures."
  "(BexSketchApp replaces this with a BexSceneBase)"
  base := BexBase new.
  "the rest is our forthlike interpreter."
  defs := Dictionary new.
  self reset.

]

{ #category : #execution }
BexRpnInterpreter >> load: aString [
  | state actions def |
  self reset.
  state := #eval. "eval | define | compile"
  toks := OrderedCollection new.
  actions := {
    #eval -> [:tok |
      (tok = #':')
        ifTrue: [ state := #define ]
        ifFalse: [ toks add: tok ]].
    #define  -> [:tok |
      defs at: tok put: (def := OrderedCollection new).
      state := #compile].
    #compile -> [:tok |
      (tok = #';')
        ifTrue: [ state := #eval ]
        ifFalse: [ def add: tok ]]} asDictionary.
  (aString substrings collect: #asSymbol) do: [:tok |
    (actions at: state) value: tok].
  defs at: self initialCtx put: toks.
  self frameChanged
]

{ #category : #ops }
BexRpnInterpreter >> o [
  self push: base o
]

{ #category : #accessing }
BexRpnInterpreter >> push: aNode [
  data push: aNode
]

{ #category : #execution }
BexRpnInterpreter >> reset [
  "destroy all context about the running program"
  ip := 1.
  ctx := self initialCtx.
  toks := #().
  ctrl := Stack new.
  data := Stack new.
  announcer announce: (BexStackFrameChangedEvent new ip: ip)
]

{ #category : #ops }
BexRpnInterpreter >> return [
  | frame |
  frame := ctrl pop.
  ip := frame first.
  ctx := frame second.
  toks := defs at: ctx
]

{ #category : #ops }
BexRpnInterpreter >> simpHi [
]

{ #category : #ops }
BexRpnInterpreter >> simpLo [
]

{ #category : #execution }
BexRpnInterpreter >> step [
  ""
  (ip > toks size) ifTrue: [self return]
  ifFalse: [ self doToken: (toks at: ip)].
  ip := ip + 1.
  announcer announce: (BexInstructionPointerChangedEvent new ip: ip)
]

{ #category : #ops }
BexRpnInterpreter >> swapHi [
  base set: branchVar to: #I in: hi
]

{ #category : #ops }
BexRpnInterpreter >> swapLo [
  base set: branchVar to: #O in: lo
]

{ #category : #accessing }
BexRpnInterpreter >> tos [
  ^ data top
]

{ #category : #events }
BexRpnInterpreter >> when: anEvent do: aBlock [
  announcer when: anEvent do: aBlock
]

{ #category : #ops }
BexRpnInterpreter >> x0 [
  self push: base x0
]

{ #category : #ops }
BexRpnInterpreter >> x1 [
  self push: base x1
]

{ #category : #ops }
BexRpnInterpreter >> x2 [
  self push: base x2
]

{ #category : #ops }
BexRpnInterpreter >> x3 [
  self push: base x3
]

{ #category : #ops }
BexRpnInterpreter >> x4 [
  self push: base x4
]

{ #category : #ops }
BexRpnInterpreter >> xor [
  ^ self binOp: #xor
]
