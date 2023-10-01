Class {
	#name : #BexRpnBuilder,
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
BexRpnBuilder >> and [
  ^ self binOp: #and
]

{ #category : #accessing }
BexRpnBuilder >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexRpnBuilder >> binOp: aSymbol [
  | x y |
  y := data pop. x := data pop.
  ^ self push: (base op: aSymbol x: x y: y)
]

{ #category : #ops }
BexRpnBuilder >> br0 [
  self branch: #x0
]

{ #category : #ops }
BexRpnBuilder >> br1 [
  self branch: #x1
]

{ #category : #ops }
BexRpnBuilder >> br2 [
  self branch: #x2
]

{ #category : #ops }
BexRpnBuilder >> br3 [
  self branch: #x3
]

{ #category : #ops }
BexRpnBuilder >> br4 [
  self branch: #x4
]

{ #category : #accessing }
BexRpnBuilder >> branch: varSymbol [
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
BexRpnBuilder >> currentTokens [
  ^ toks
]

{ #category : #execution }
BexRpnBuilder >> doToken: aString [
  self perform: aString asSymbol
]

{ #category : #ops }
BexRpnBuilder >> dup [
  self push: base dup.
]

{ #category : #ops }
BexRpnBuilder >> i [
  self push: base i
]

{ #category : #accessing }
BexRpnBuilder >> initialize [
  super initialize.
  "the base builds the actual data structures"
  base := BexBase new.
  "the rest is our forthlike interpreter."
  data := Stack new.
  ctrl := Stack new.
  defs := Dictionary new.
  "make ourselves observable to the debugger"
  announcer := Announcer new.  self reset.

]

{ #category : #ops }
BexRpnBuilder >> o [
  self push: base o
]

{ #category : #accessing }
BexRpnBuilder >> push: aNode [
  data push: aNode
]

{ #category : #execution }
BexRpnBuilder >> reset [
  "destroy all context about the running program"
  ip := 0.
  ctx := #'(top)'.
  toks := #().
  announcer announce: BexStackFrameChangedEvent new
]

{ #category : #execution }
BexRpnBuilder >> run: aString [
  self reset.
  toks := aString substrings collect: #asSymbol.
  announcer announce: BexStackFrameChangedEvent new
]

{ #category : #ops }
BexRpnBuilder >> simpHi [
]

{ #category : #ops }
BexRpnBuilder >> simpLo [
]

{ #category : #ops }
BexRpnBuilder >> swapHi [
  base set: branchVar to: #I in: hi
]

{ #category : #ops }
BexRpnBuilder >> swapLo [
  base set: branchVar to: #O in: lo
]

{ #category : #accessing }
BexRpnBuilder >> tos [
  ^ data top
]

{ #category : #events }
BexRpnBuilder >> when: anEvent do: aBlock [
  announcer when: anEvent do: aBlock
]

{ #category : #ops }
BexRpnBuilder >> x0 [
  self push: base x0
]

{ #category : #ops }
BexRpnBuilder >> x1 [
  self push: base x1
]

{ #category : #ops }
BexRpnBuilder >> x2 [
  self push: base x2
]

{ #category : #ops }
BexRpnBuilder >> x3 [
  self push: base x3
]

{ #category : #ops }
BexRpnBuilder >> x4 [
  self push: base x4
]

{ #category : #ops }
BexRpnBuilder >> xor [
  ^ self binOp: #xor
]
