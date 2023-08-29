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
GsSelection >> add: aShape [
  |shapeRect|
  shapeRect := aShape boundingRect asRectangle.
  self
    ifNotEmpty: [rect := rect merge: shapeRect]
    ifEmpty: [rect := shapeRect].
  super add: aShape.
]

{ #category : #accessing }
GsSelection >> addLast: aShape [
  |shapeRect|
  shapeRect := aShape boundingRect asRectangle.
  self
    ifNotEmpty: [rect := rect merge: shapeRect]
    ifEmpty: [rect := shapeRect].
  super addLast: aShape.
]

{ #category : #accessing }
GsSelection >> boundingRect [
  ^ rect
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
