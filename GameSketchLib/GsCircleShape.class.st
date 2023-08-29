"
I represent a circle.

"
Class {
	#name : #GsCircleShape,
	#superclass : #GsShape,
	#instVars : [
		'center',
		'radius'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsCircleShape class >> newAtPoint: aCenter [
  ^ self new center: aCenter
]

{ #category : #initialization }
GsCircleShape >> center: aPoint [
  center := aPoint.
  self rebuildShape
]

{ #category : #accessing }
GsCircleShape >> gsPosition [
  ^ center
]

{ #category : #accessing }
GsCircleShape >> gsPosition: aPoint [
  self center: aPoint
]

{ #category : #accessing }
GsCircleShape >> gsTop [
  ^ center y - radius
]

{ #category : #initialization }
GsCircleShape >> initialize [
  super initialize.
  center := 0@0.
  radius := 10.
  self geometry: BlEllipseGeometry new; rebuildShape
]

{ #category : #accessing }
GsCircleShape >> radius [
  ^ radius
]

{ #category : #accessing }
GsCircleShape >> radius: anObject [
  radius := anObject.
  self rebuildShape
]

{ #category : #accessing }
GsCircleShape >> rebuildShape [
  |size| size := radius asPoint.
  self relocate: center - size;
  size: size * 2
]

{ #category : #'shape - handles' }
GsCircleShape >> secondPoint: aPoint [
  self radius: (center distanceTo: aPoint)
]
