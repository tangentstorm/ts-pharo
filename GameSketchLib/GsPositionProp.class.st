"
I am a {{gtClass:GsSetter}}for position.
"
Class {
	#name : #GsPositionProp,
	#superclass : #GsProp,
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsPositionProp >> write: aPoint to: anObject [
  anObject relocate: aPoint
]
