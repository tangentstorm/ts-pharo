"
I am a {{gtClass:GsSetter}}for rotation.
"
Class {
	#name : #GsRotationSetter,
	#superclass : #GsSetter,
	#category : #'GameSketchLib-Setters'
}

{ #category : #accessing }
GsRotationSetter >> set: aDegreeValue [
  target transform
    rotateBy: aDegreeValue;
    apply
]
