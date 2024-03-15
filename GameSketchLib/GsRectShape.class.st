"
I represent a rectangle.

"
Class {
	#name : #GsRectShape,
	#superclass : #GsShape,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsRectShape class >> newAtPoint: aPoint [
  ^ self new xy: aPoint; wh: 10@10
]

{ #category : #accessing }
GsRectShape >> bg: aColor [ 
]

{ #category : #accessing }
GsRectShape >> fg: aColor [ 
]

{ #category : #accessing }
GsRectShape >> fromData: dict [
  self xy: (dict at: 'x')@(dict at: 'y').
  self wh: (dict at:'w')@(dict at:'h').
  self bg: (GsColor from: (dict at:'bg')).
  self fg: (GsColor from: (dict at:'fg')).
  
]

{ #category : #accessing }
GsRectShape >> gsSvgOn: aStream [
  | x y w h|
  x := (xy x roundTo: 0.001) asString.
  y := (xy y roundTo: 0.001) asString.
  w := (wh x roundTo: 0.001) asString.
  h := (wh y roundTo: 0.001) asString.
  aStream
    nextPutAll: '<rect x="', x, '" y="', y, '"';
    nextPutAll: ' width="',w, '" height="',h,'"'.
  self gsSvgStyleOn: aStream.
  aStream nextPutAll: '/>'
]

{ #category : #accessing }
GsRectShape >> initialize [
  super initialize.
  xy := 0@0.
  wh := 1@1.
  self rebuildShape
]

{ #category : #accessing }
GsRectShape >> makeElement [
  ^ BlElement new
]

{ #category : #'gsl - shapes' }
GsRectShape >> rebuildShape [
  self relocate: xy; size: wh
]

{ #category : #accessing }
GsRectShape >> relocate: aPoint [
  super relocate: (xy := aPoint)
]

{ #category : #accessing }
GsRectShape >> secondPoint [
  ^ xy + wh
]

{ #category : #'gsl - shapes' }
GsRectShape >> secondPoint: aPoint [
  self wh: (aPoint - xy)
]

{ #category : #accessing }
GsRectShape >> secondPointDescription [
  ^ GsPointDescription new
    accessor: #secondPoint;
    label: 'width/height handle'
]

{ #category : #accessing }
GsRectShape >> size: anExtent [
  super size: (wh := anExtent)
]

{ #category : #accessing }
GsRectShape >> wh [
  ^ wh roundTo: 0.0001
]

{ #category : #accessing }
GsRectShape >> wh: aPoint [
  wh := aPoint.
  self rebuildShape
]

{ #category : #accessing }
GsRectShape >> whDescription [
  <magritteDescription>
  ^ GsPointDescription new
      label: 'wh';
      accessor: #wh
]

{ #category : #accessing }
GsRectShape >> xy [
  ^ xy roundTo: 0.0001
]

{ #category : #accessing }
GsRectShape >> xy: aPoint [
  xy := aPoint.
  self rebuildShape
]

{ #category : #accessing }
GsRectShape >> xyDescription [
  <magritteDescription>
  ^ GsPointDescription new
      label: 'xy';
      accessor: #xy
]
