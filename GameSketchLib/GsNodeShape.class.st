"
A box with text in it, that can contain other nodes and be linked to other nodes via edges.

"
Class {
	#name : #GsNodeShape,
	#superclass : #GsTextShape,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsNodeShape >> initialize [
  super initialize text: 'New Node'.
  visuals := GsStyle default.
]
