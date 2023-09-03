"
I am a {{gtClass:GsSetter}}for position.
"
Class {
	#name : #GsPositionProp,
	#superclass : #GsProp,
	#category : #'GameSketchLib-Setters'
}

{ #category : #accessing }
GsPositionProp >> set: aPoint [
  target relocate: aPoint
]
