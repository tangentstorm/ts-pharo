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
  self do: [:x| x removeFromParent. scene addChild: x].
]

{ #category : #accessing }
GsSelection >> changed [
  announcer announce: GsSelectionChanged new
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
  self reversed do: [:x | x removeFromParent. scene addChildFirst: x ]
]

{ #category : #accessing }
GsSelection >> species [
  "this is so collect: lets you collect non-shapes"
  ^ OrderedCollection
]

{ #category : #alignment }
GsSelection >> vAlignCenters [
  "align centers vertically"
  |cy|
  cy := self boundingRect center y.
  self do: [:x| x gsCenter: (x gsCenter x) @ cy]
]

{ #category : #alignment }
GsSelection >> vAlignTops [
  self do: [:x | x gsTop: self boundingRect top]
]

{ #category : #accessing }
GsSelection >> whenChangedDo: aBlock [
  announcer when: GsSelectionChanged do: aBlock.
]
