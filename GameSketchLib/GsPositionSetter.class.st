"
I am a {{gtClass:GsSetter}}for position.
"
Class {
	#name : #GsPositionSetter,
	#superclass : #GsSetter,
	#category : #'GameSketchLib-Setters'
}

{ #category : #accessing }
GsPositionSetter >> set: aPoint [
  target relocate: aPoint
]
