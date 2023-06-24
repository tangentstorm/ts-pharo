Class {
	#name : #GsEllipse,
	#superclass : #GsObject,
	#instVars : [
		'radius',
		'position'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsEllipse >> initialize [
  super initialize.
  self
    geometry: BlEllipseGeometry new;
    radius: 32;
    background: GsColors gold
]

{ #category : #accessing }
GsEllipse >> position [
	^ position
]

{ #category : #accessing }
GsEllipse >> position1: anObject [
	position := anObject
]

{ #category : #accessing }
GsEllipse >> position: aPoint [
  "Bloc doesn't provide position until the bounds are calculated, so this lets us bypass that."
  position := aPoint.
  self relocate: position.
]

{ #category : #accessing }
GsEllipse >> radius [
	^ radius
]

{ #category : #accessing }
GsEllipse >> radius: x [
  radius := x.
  self size: x@x
]
