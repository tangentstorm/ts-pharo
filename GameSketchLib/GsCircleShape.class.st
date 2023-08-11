Class {
	#name : #GsCircleShape,
	#superclass : #GsShape,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsCircleShape >> c: aPoint [
  self relocate: aPoint
]

{ #category : #accessing }
GsCircleShape >> initialize [
  super initialize.
  self geometry: BlEllipseGeometry new
]

{ #category : #accessing }
GsCircleShape >> r: aNumber [
  self size: aNumber asPoint
]
