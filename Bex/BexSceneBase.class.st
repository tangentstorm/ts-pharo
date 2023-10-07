"
I am a wrapper for BexBase that draws my contents in a GsScene.

While a base often returns the same node for the same request (especially for simple variabes and constants), I create a new BexViewModel for each part of the expression, so that each copy of the expression can be drawn and animated independently.


"
Class {
	#name : #BexSceneBase,
	#superclass : #Object,
	#traits : 'TCaseMethod',
	#classTraits : 'TCaseMethod classTrait',
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
  this userData at: #valence put: 0.
  here := here + (50@0).
  ^ this
]

{ #category : #accessing }
BexSceneBase >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexSceneBase >> branch: varSymbol hi: hi lo: lo [
  | res e sym|
  sym := ('br' , varSymbol allButFirst) asSymbol.
  res := self op: varSymbol x: lo y: hi.
  res cornerRadius: 25.
  e := res userData at: #incoming.
  e first gsStrokeStyle: #dashed; dstMarker: #none.
  e second gsStrokeStyle: #solid; dstMarker: #none.
  ^ res
]

{ #category : #accessing }
BexSceneBase >> dagFor: node [
  | res udata|
  res := OrderedCollection new.
  res add: node.
  udata := node userData.
  (udata at: #args ifPresent: [:args |
    res := res, (udata at: #incoming).
    args do: [:arg |
      res := res, (self dagFor: arg)]]).
  ^ res
]

{ #category : #accessing }
BexSceneBase >> dup [
  | sel idMap dupes dx newVersion rs|
  sel := GsSelection new scene: scene.
  sel addAll: (self dagFor: self last).

  "GsScene >> duplicate, but don't wait for layout."
  idMap := Dictionary new.
  dupes := sel collect: [:o||c|
    c := o gsCopy id: scene nextId.
    [c cornerRadius: o cornerRadius] onErrorDo: [].
    idMap at: o id asSymbol put: c.
    c].
    
  dx := sel boundingRect width + 50.
  scene addChildren: dupes.
  dupes do: [:o | o gsUpdateDependencies: idMap].
  dupes select: #gsIsPositionable thenDo: [:o |
    o gsPosition: o intendedPosition + (dx@0)].

  newVersion := [:o | idMap at: o id asSymbol].
  
  rs := ReadStream on: dupes.
  sel do: [:o | |c uo uc| c := rs next.
    uo := o userData.
    uo at: #args ifPresent: [:args |
      uc := c userData.
      uc at: #args put: (args collect: newVersion).
      uc at: #incoming put: ((uo at: #incoming) collect: newVersion)]].

  ^ this := (newVersion value: self last).
]

{ #category : #accessing }
BexSceneBase >> i [
  ^ self addShape: #I
]

{ #category : #accessing }
BexSceneBase >> initialize [
  super initialize.
  base := BexBase new.
  scene := GsScene new.
  this := nil.
  here := 200@600.
]

{ #category : #accessing }
BexSceneBase >> last [
  ^ this
]

{ #category : #accessing }
BexSceneBase >> node: aNode toArg: ix [
  ^ OrderedCollection new
]

{ #category : #accessing }
BexSceneBase >> o [
  ^ self addShape: #O
]

{ #category : #accessing }
BexSceneBase >> op: anOp x: xNode y: yNode [
  | xpos ypos e0 e1|
  xpos := xNode intendedPosition.
  ypos := yNode intendedPosition.
  this := BexShape new symbol: anOp;
    id: scene nextId;
    gsPosition: ((xpos x + ypos x) / 2)
               @((xpos y min: ypos y) - 70).
  scene addChildren: {
    this.
    e0 := GsEdgeShape new src: xNode; dst: this; id: scene nextId.
    e1 := GsEdgeShape new src: yNode; dst: this; id: scene nextId}.
  this userData
    at: #valence put: 2;
    at: #incoming put: { e0. e1 };
    at: #args put: { xNode. yNode }.
  ^ this
]

{ #category : #accessing }
BexSceneBase >> scene [
  ^ scene
]

{ #category : #accessing }
BexSceneBase >> scene: aScene [
  scene := aScene
]

{ #category : #accessing }
BexSceneBase >> set: aVarSymbol to: aNewSymbol in: anExprNode [
  "perform a simple literal substitution in the expression"
  (self dagFor: anExprNode) select: [:o|
    (o isKindOf: BexShape) and: [o symbol = aVarSymbol]]
  thenDo: [:o | o symbol: aNewSymbol]
]

{ #category : #accessing }
BexSceneBase >> simp: aNode [
  | tick syms ixI ixO hasI hasO other |
  tick := [:i | ('`' ,(scene idFromNumber: i) asString) asSymbol ].
  syms := aNode argSymbols.
  ixI := syms indexOf: #I. hasI := ixI > 0.
  ixO := syms indexOf: #O. hasO := ixO > 0.
  other := [:i| 2-(i-1)]. "other:2->1 and vice versa"
  self case: aNode symbol of:{
    #and -> [
      hasO ifTrue: [^ self node: aNode toArg: ixO ].
      hasI ifTrue: [^ self node: aNode toArg: (other value: ixO)].
      "TODO: x and x, x and ~x"].
    #or -> [
      hasI ifTrue: [^ self node: aNode toArg: ixI].
      hasO ifTrue: [^ self node: aNode toArg: (other value: ixO)]].
    #xor -> [
      hasO ifTrue: [^ self node: aNode toArg: (other value: ixO)].
      hasI ifTrue: [^ self node: aNode toArg: (other value: ixI) negated]]}.
  ^ OrderedCollection new.
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
