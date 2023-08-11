Class {
	#name : #GsRectShape,
	#superclass : #GsShape,
	#category : #'GameSketchLib-Examples'
}

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
GsRectShape >> makeElement [
  ^ BlElement new
]

{ #category : #accessing }
GsRectShape >> wh: aPoint [ 
]

{ #category : #accessing }
GsRectShape >> xy: aPoint [ 
]
