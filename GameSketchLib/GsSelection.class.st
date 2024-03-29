"
I am an OrderedCollection of {{gtClass:GsShape}} istances. 

When populated, I can apply layouts to, arrange, and align the shapes in various ways.

I have a bounding box that encompasses all the shapes.

"
Class {
	#name : #GsSelection,
	#superclass : #OrderedCollection,
	#instVars : [
		'rect',
		'scene',
		'announcer'
	],
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsSelection class >> basicNew [
  ^ super basicNew basicInitialize
]

{ #category : #accessing }
GsSelection >> addLast: aShape [
  |shapeRect|
  shapeRect := aShape bounds asRectangle.
  self
    ifNotEmpty: [rect := rect merge: shapeRect]
    ifEmpty: [rect := shapeRect].
  super addLast: aShape.
  self changed.
]

{ #category : #alignment }
GsSelection >> alignBottoms [
  <gsArrangeCmd>
  self positionableShapes do: [:x | x gsBottom: self boundingRect bottom].
  self updateBounds
]

{ #category : #alignment }
GsSelection >> alignLefts [
  <gsArrangeCmd>
  self positionableShapes do: [:x | x gsLeft: self boundingRect left].
  self updateBounds
]

{ #category : #alignment }
GsSelection >> alignRights [
  <gsArrangeCmd>
  self positionableShapes do: [:x | x gsRight: self boundingRect right].
  self updateBounds
]

{ #category : #alignment }
GsSelection >> alignTops [
  <gsArrangeCmd>
  self positionableShapes do: [:x | x gsTop: self boundingRect top].
  self updateBounds
]

{ #category : #initialization }
GsSelection >> basicInitialize [
  "OrderedCollection never calls initialize"
  announcer := Announcer new.
  self reset.
]

{ #category : #accessing }
GsSelection >> boundingRect [
  ^ rect
]

{ #category : #accessing }
GsSelection >> boundingRect: aRectangle [
  "helpful when the selectangle moves around"
  rect := aRectangle.
]

{ #category : #accessing }
GsSelection >> bringToFront [
  <gsArrangeCmd>
  self do: [:x| x removeFromParent. scene addChild: x].
]

{ #category : #accessing }
GsSelection >> changed [
  announcer announce: GsSelectionChanged new
]

{ #category : #alignment }
GsSelection >> delete [
  <gsArrangeCmd>
  self do: [:o | o removeFromParent]; reset
]

{ #category : #alignment }
GsSelection >> distributeH [
  <gsArrangeCmd>
  "distribute horizontally"
  |offset elementsWidth spacing items |
  items := self positionableShapes.
  (items size < 2) ifTrue: [^ self].
  elementsWidth := items sum: [:x | x gsRight - x gsLeft].
  spacing := (self boundingRect width - elementsWidth) / (items size -1).
  offset := 0.
  items do: [:x | 
      x gsLeft: self boundingRect left+offset.
      offset := offset+spacing + x width].
  self updateBounds
]

{ #category : #alignment }
GsSelection >> duplicate [
  <gsArrangeCmd>
  |dupes idMap| 
  idMap := Dictionary new.
  dupes := self collect: [:o||c|
    c := o gsCopy id: scene nextId.
    idMap at: o id asSymbol put: c.
    c].
  self reset.
  scene addChildren: dupes;
    when: BlElementLayoutComputedEvent doOnce: [
      dupes do: [:o | o gsUpdateDependencies: idMap].
      scene when: BlElementLayoutComputedEvent doOnce: [
        self addAll: dupes.
        self updateBounds]].
]

{ #category : #alignment }
GsSelection >> group [
  <gsArrangeCmd>
  "group selection as one item"
  | r shapes group |
  r := rect.
  shapes := self copy. self delete.
  scene addChild: (group := BlElement new
    relocate: r topLeft; size: r extent;
    addChildren: (shapes collect: [:o|
      o gsPosition: (o gsPosition - r topLeft)]);
    when: BlElementExtentChangedEvent doOnce: [self add: group]).
  
]

{ #category : #alignment }
GsSelection >> hAlignCenters [
  <gsArrangeCmd>
  "align centers horizontally"
  |cx| cx := self boundingRect center x.
  self positionableShapes do: [:o| o gsCenter: cx@(o gsCenter y)].
  self updateBounds
]

{ #category : #alignment }
GsSelection >> makeRow [
  <gsArrangeCmd>
  "make a row horizontally"
  |start left items|
  items := self positionableShapes.
  items sort: [:a :b| (a gsPosition x) <= (b gsPosition x)].
  start := items first gsPosition. 
  left := start x.
  items inject: left into: [:a :o | o gsPosition: a @ (start y). a + o width ].
  self updateBounds
]

{ #category : #accessing }
GsSelection >> positionableShapes [
  ^ self select: [:o| o gsIsPositionable]
]

{ #category : #accessing }
GsSelection >> reset [
  super reset.
  rect := Rectangle
    origin: 0@0
    extent: 0@0.
  self changed.
]

{ #category : #accessing }
GsSelection >> scene [
  ^ scene
]

{ #category : #accessing }
GsSelection >> scene: aScene [
  scene := aScene
]

{ #category : #accessing }
GsSelection >> sendToBack [
  <gsArrangeCmd>
  self reversed do: [:x | x removeFromParent. scene addChildFirst: x ]
]

{ #category : #accessing }
GsSelection >> species [
  "this is so collect: lets you collect non-shapes"
  ^ OrderedCollection
]

{ #category : #accessing }
GsSelection >> updateBounds [
  |items| items := self copy.
  self reset; addAll: items.
  scene when: BlElementLayoutComputedEvent doOnce: [
    self reset; addAll: items.]
]

{ #category : #alignment }
GsSelection >> vAlignCenters [
  <gsArrangeCmd>
  "align centers vertically"
  |cy| cy := self boundingRect center y.
  self positionableShapes do: [:o| o gsCenter: (o gsCenter x) @ cy].
  self updateBounds
]

{ #category : #accessing }
GsSelection >> whenChangedDo: aBlock [
  announcer when: GsSelectionChanged do: aBlock.
]
