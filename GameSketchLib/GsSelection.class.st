"
I am an OrderedCollection of {{gtClass:GsShape}} istances. 

When populated, I can apply layouts to, arrange, and align the shapes in various ways.

I have a bounding box that encompasses all the shapes.

"
Class {
	#name : #GsSelection,
	#superclass : #OrderedCollection,
	#instVars : [
		'rect'
	],
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsSelection >> addLast: aShape [
  |shapeRect|
  shapeRect := aShape bounds asRectangle.
  self
    ifNotEmpty: [rect := rect merge: shapeRect]
    ifEmpty: [rect := shapeRect].
  super addLast: aShape.
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

{ #category : #initialization }
GsSelection >> initialize [
  super initialize.
  self reset.
]

{ #category : #accessing }
GsSelection >> reset [
  super reset.
  rect := Rectangle
    origin: 0@0
    extent: 0@0.
]
