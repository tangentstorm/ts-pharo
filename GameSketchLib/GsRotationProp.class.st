"
I am a {{gtClass:GsSetter}}for rotation.
"
Class {
	#name : #GsRotationProp,
	#superclass : #GsProp,
	#category : #'GameSketchLib-Setters'
}

{ #category : #accessing }
GsRotationProp >> set: aDegreeValue [
  target transform
    rotateBy: aDegreeValue;
    apply
]
