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

{ #category : #accessing }
GsCircleShape class >> centerDescription [
]

{ #category : #creating }
GsCircleShape class >> newAtPoint: aCenter [
  ^ self new center: aCenter
]

{ #category : #accessing }
GsCircleShape >> center [
  ^ center
]

{ #category : #accessing }
GsCircleShape >> center: aPoint [
  center := aPoint roundTo: 0.001.
  self rebuildShape
]

{ #category : #magritte }
GsCircleShape >> centerDescription [
  <magritteDescription>
  ^ GsPointDescription new
    priority: 100;
    accessor: #center;
    label: 'Center'
]

{ #category : #accessing }
GsCircleShape >> gsCenter [
  ^ center
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
GsCircleShape >> radius: aNumber [
  radius := aNumber roundTo: 0.001.
  self rebuildShape
]

{ #category : #magritte }
GsCircleShape >> radiusDescription [
  <magritteDescription>
  ^ MANumberDescription new
    priority: 110;
    accessor: #radius;
    label: 'Radius';
    yourself.
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
