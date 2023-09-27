"
I am a wrapper for BexBase that draws my contents in a GsScene.

While a base often returns the same node for the same request (especially for simple variabes and constants), I create a new BexViewModel for each part of the expression, so that each copy of the expression can be drawn and animated independently.


"
Class {
	#name : #BexSceneBase,
	#superclass : #Object,
	#instVars : [
		'scene',
		'here',
		'this',
		'rpn',
		'base'
	],
	#category : #'Bex-Drawing'
}

{ #category : #accessing }
BexSceneBase >> addShape: aSymbol [
  scene addChild: (this := BexShape new 
    symbol: aSymbol; gsPosition: here;
    id: scene nextId).
  here := here + (50@0).
  ^ this
]

{ #category : #accessing }
BexSceneBase >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexSceneBase >> initialize [
  super initialize.
  base := BexBase new.
  scene := GsScene new.
  this := nil.
  here := 200@300.
]

{ #category : #accessing }
BexSceneBase >> op: anOp x: xNode y: yNode [
  | xpos ypos |
  xpos := xNode intendedPosition.
  ypos := yNode intendedPosition.
  this := BexShape new symbol: anOp;
    id: scene nextId;
    gsPosition: ((xpos x + ypos x) / 2)
               @((xpos y min: ypos y) - 70).
  scene addChild: this.
  scene addChild: (GsEdgeShape new src: xNode; dst: this).
  scene addChild: (GsEdgeShape new src: yNode; dst: this).
  ^ this
]

{ #category : #accessing }
BexSceneBase >> scene: aScene [
  scene := aScene
]

{ #category : #accessing }
BexSceneBase >> x0 [
  ^ self addShape: #x0
]

{ #category : #accessing }
BexSceneBase >> x1 [
  ^ self addShape: #x1
]

{ #category : #accessing }
BexSceneBase >> x2 [
  ^ self addShape: #x2
]
