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

{ #category : #'gsl - shapes' }
GsRectShape >> secondPoint: aPoint [
  self wh: (aPoint - xy)
]

{ #category : #accessing }
GsRectShape >> wh: aPoint [
  wh := aPoint.
  self rebuildShape
]

{ #category : #accessing }
GsRectShape >> xy: aPoint [
  xy := aPoint.
  self rebuildShape
]
