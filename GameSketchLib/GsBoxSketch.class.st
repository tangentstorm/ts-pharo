Class {
	#name : #GsBoxSketch,
	#superclass : #GsSketch,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsBoxSketch >> bg: aColor [ 
]

{ #category : #accessing }
GsBoxSketch >> fg: aColor [ 
]

{ #category : #accessing }
GsBoxSketch >> fromData: dict [
  self xy: (dict at: 'x')@(dict at: 'y').
  self wh: (dict at:'w')@(dict at:'h').
  self bg: (GsColor from: (dict at:'bg')).
  self fg: (GsColor from: (dict at:'fg')).
  
]

{ #category : #accessing }
GsBoxSketch >> makeElement [
  ^ BlElement new
]

{ #category : #accessing }
GsBoxSketch >> wh: aPoint [ 
]

{ #category : #accessing }
GsBoxSketch >> xy: aPoint [ 
]
