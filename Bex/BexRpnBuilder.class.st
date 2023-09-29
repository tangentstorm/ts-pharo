Class {
	#name : #BexRpnBuilder,
	#superclass : #Object,
	#instVars : [
		'stack',
		'nodes',
		'base'
	],
	#category : #'Bex-RPN'
}

{ #category : #accessing }
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
  y := stack pop. x := stack pop.
  ^ self push: (base op: aSymbol x: x y: y)
]

{ #category : #accessing }
BexRpnBuilder >> branch: aSymbol [
  | x y o e |
  y := stack pop. x := stack pop.
  o := base op: aSymbol x: x y: y.
  o cornerRadius: 25.
  e := o userData at: #incoming.
  e first gsStrokeStyle: #dashed; dstMarker: #none.
  e second gsStrokeStyle: #solid; dstMarker: #none.
  ^ self push: o
]

{ #category : #accessing }
BexRpnBuilder >> dup [
  self push: base dup.
]

{ #category : #accessing }
BexRpnBuilder >> initialize [
  super initialize.
  base := BexBase new.
  stack := Stack new.
  nodes := Dictionary new.
]

{ #category : #accessing }
BexRpnBuilder >> push: aNode [
  stack push: aNode
]

{ #category : #accessing }
BexRpnBuilder >> simpHi [
]

{ #category : #accessing }
BexRpnBuilder >> simpLo [
]

{ #category : #accessing }
BexRpnBuilder >> tos [
  ^ stack top
]

{ #category : #accessing }
BexRpnBuilder >> x0 [
  self push: base x0
]

{ #category : #accessing }
BexRpnBuilder >> x1 [
  self push: base x1
]

{ #category : #accessing }
BexRpnBuilder >> x2 [
  self push: base x2
]

{ #category : #accessing }
BexRpnBuilder >> x3 [
  self push: base x3
]

{ #category : #accessing }
BexRpnBuilder >> x4 [
  self push: base x4
]

{ #category : #accessing }
BexRpnBuilder >> xor [
  ^ self binOp: #xor
]
