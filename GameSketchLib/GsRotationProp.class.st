"
I am a {{gtClass:GsSetter}}for rotation.
"
Class {
	#name : #GsRotationProp,
	#superclass : #GsProp,
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsRotationProp >> write: aDegreeValue to: aTarget [
  aTarget transform
    rotateBy: aDegreeValue;
    apply
]
