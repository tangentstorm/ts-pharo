Class {
	#name : #GsHandle,
	#superclass : #GsObject,
	#instVars : [
		'point'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsHandle >> initialize [
  super initialize.
  self size: 9 asPoint;
    geometry: BlCircleGeometry new;
    background: GsColor handleColor;
    border: Color black.
]

{ #category : #accessing }
GsHandle >> point: aPoint [ 
  point := aPoint.
  self relocate: point - (4.5 asPoint)
]
