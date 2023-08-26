"
I represent a simple line segment.

"
Class {
	#name : #GsLineShape,
	#superclass : #BlLineElement,
	#instVars : [
		'p1',
		'p2'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsLineShape class >> newAtPoint: aPoint [
  ^ self new p1: aPoint; p2: aPoint + 10@0
]

{ #category : #accessing }
GsLineShape >> gsContainsPoint: p [
  ^ self geometry containsPoint: p - self position in: self parent
]

{ #category : #initialization }
GsLineShape >> initialize [
  super initialize.
  self geometry: BlLine new;
  	border: Color black.
 
]

{ #category : #accessing }
GsLineShape >> p1 [
	^ p1
]

{ #category : #accessing }
GsLineShape >> p1: aPoint [
  p1 := aPoint.
  self fromAnchor: (BlAbsolutePositionAnchor position: aPoint)
]

{ #category : #accessing }
GsLineShape >> p2 [
	^ p2
]

{ #category : #accessing }
GsLineShape >> p2: aPoint [
  p2 := aPoint.
  self toAnchor:(BlAbsolutePositionAnchor position: aPoint)
]

{ #category : #accessing }
GsLineShape >> secondPoint: aPoint [
  self p2: aPoint
]

{ #category : #accessing }
GsLineShape >> shapePosition [
  ^ p1
]

{ #category : #accessing }
GsLineShape >> shapePosition: aPoint [
  |diff|
  diff := (aPoint - p1).
  self
    p1: p1 + diff;
    p2: p2 + diff.
]
