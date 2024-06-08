"
I am a wrapper for BexBase that draws my contents in a GsScene.

While a base often returns the same node for the same request (especially for simple variabes and constants), I create a new BexViewModel for each part of the expression, so that each copy of the expression can be drawn and animated independently.

Collaborators:
  {{gtClass:BexNodeShape}}
  {{gtClass:BexEdgeShape}}
  {{gtClass:BexRpnInterpreter}}
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
  scene addChild: (this := BexNodeShape new 
    symbol: aSymbol; gsPosition: here;
    id: scene nextId).
  this userData at: #valence put: 0.
  here := here + (50@0).
  ^ this
]

{ #category : #accessing }
BexSceneBase >> base: aBase [
  self error: 'deprecated'
]

{ #category : #accessing }
BexSceneBase >> branch: varSymbol hi: hi lo: lo [
  | res e sym|
  sym := ('br' , varSymbol allButFirst) asSymbol.
  res := self op: sym x: lo y: hi.
  res cornerRadius: 25.
  e := res userData at: #childEdges.
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
    res := res, (udata at: #childEdges).
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
  sel do: [:o | |child |
    child := rs next.
    o userData at: #args ifPresent: [:args |
      child args: (args collect: newVersion).
      child childEdges: (o childEdges collect: newVersion).
      child parentEdges: (o parentEdges collect: newVersion)]].

  ^ this := (newVersion value: self last).
]

{ #category : #accessing }
BexSceneBase >> i [
  ^ self addShape: #I
]

{ #category : #accessing }
BexSceneBase >> initialize [
  super initialize.
  scene := GsScene new.
  this := nil.
  here := 200@600.
]

{ #category : #accessing }
BexSceneBase >> last [
  ^ this
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
  this := BexNodeShape new symbol: anOp;
    id: scene nextId;
    gsPosition: ((xpos x + ypos x) / 2)
               @((xpos y min: ypos y) - 70).
  scene addChildren: {
    this.
    e0 := BexEdgeShape new src: xNode; dst: this; id: scene nextId.
    e1 := BexEdgeShape new src: yNode; dst: this; id: scene nextId}.
  this userData at: #valence put: 2.
  this addEdge: e0 to: xNode.
  this addEdge: e1 to: yNode.
  ^ this
]

{ #category : #accessing }
BexSceneBase >> otherBranch: ix [
  "given one branch index (1 or 2), return the other"
  ^ 2-(ix-1)
]

{ #category : #accessing }
BexSceneBase >> replaceNode: aNode withArg: ix [
  | udata edges nodes tick kept res toHide|
  udata := aNode userData.
  edges := udata at: #childEdges.
  nodes := udata at: #args.
  kept := nodes at: ix abs. "the node to 'keep'"
  tick := [:sym | ('`', sym asString) asSymbol].
  res := OrderedCollection new.
  res addAll: {
    "move the kept node over the current slot"
    kept quoteId. aNode quoteId. #pos. #mov.
    "replace the symbol"
    aNode quoteId. kept symbol quoteForRpn. #setSymbol}.
  "prepare to hide the old children (but wait until we see what grandchildren we keep)"
  toHide := (self dagFor: aNode).
  "disconnect the old children"
  udata at: #childEdges put: ((kept userData at: #childEdges ifAbsentPut:[{}])
    collect: [:edge|
      "TODO: changing the src/dst screws up the animation because it happens before the nodes move and hide. fix this."
      (edge src = kept) ifTrue: [edge dst: aNode. "res addAll: { edge quoteId. aNode quoteId. #src }"].
      (edge dst = kept) ifTrue: [edge dst: aNode] ]).
  udata at: #args put: (kept userData at: #args ifAbsentPut: [{}]).
  "now hide, but keep the shapes that are still connected:"
  res addAll: { toHide difference: (self dagFor: aNode). #hideAll }.
  ^ res
]

{ #category : #accessing }
BexSceneBase >> replaceNode: aNode withArg: ix andNegate: anEdge [
  | res | 
  res := self replaceNode: aNode withArg: ix .
  res addAll: { anEdge quoteId. #invert }.
  ^ res
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
    (o isKindOf: BexNodeShape) and: [o symbol = aVarSymbol]]
  thenDo: [:o | o symbol: aNewSymbol]
]

{ #category : #accessing }
BexSceneBase >> simp: aNode [
  | tick syms ixI ixO hasI hasO |
  tick := [:i | ('`' ,(scene idFromNumber: i) asString) asSymbol ].
  syms := aNode argSymbols.
  ixI := syms indexOf: #I. hasI := ixI > 0.
  ixO := syms indexOf: #O. hasO := ixO > 0.  
  self case: aNode symbol of:{
    [:x | x isBexConstant ] -> [
      aNode parentEdge isInverted
        ifTrue: [(aNode symbol = #I)
          ifTrue: [ ^{ aNode quoteId. #'`O'. #setSymbol. aNode parentEdge quoteId. #invert }]
          ifFalse: [ ^{aNode quoteId. #'`I'. #setSymbol. aNode parentEdge quoteId. #invert }]]
        ifFalse: [^ {}]].
    [:x | x isBexLiteral ] -> [ ^{} ].
    #and -> [
      hasO ifTrue: [^ self replaceNode: aNode withArg: ixO ].
      hasI ifTrue: [^ self replaceNode: aNode withArg: (self otherBranch:ixI)].
      "TODO: x and x, x and ~x"].
    #or -> [
      hasI ifTrue: [^ self replaceNode: aNode withArg: ixI].
      hasO ifTrue: [^ self replaceNode: aNode withArg: (self otherBranch: ixO)]].
    #xor -> [
      hasO ifTrue: [^ self replaceNode: aNode withArg: (self otherBranch: ixO)].
      hasI ifTrue: [^ self replaceNode: aNode withArg: (self otherBranch: ixI) andNegate: aNode parentEdge]].
    [:x | x beginsWith: 'br'] -> [^ aNode args flatCollect: [:o | self simp: o]].
    [:x | true ] -> [self error: 'unhandled case: ',(aNode symbol asString)]}.
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
