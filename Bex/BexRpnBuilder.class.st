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
  | x y |
  y := stack pop. x := stack pop.
  self push: (base op: #and x: x y: y)
]

{ #category : #accessing }
BexRpnBuilder >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexRpnBuilder >> branch [
]

{ #category : #accessing }
BexRpnBuilder >> branch: aSymbol [

]

{ #category : #accessing }
BexRpnBuilder >> dup [
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
  | x y |
  y := stack pop. x := stack pop.
  self push: (base op: #xor x: x y: y)
]
