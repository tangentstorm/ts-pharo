"
I am a {{gtClass:GsGroup}} that  (in the future) can have attached scripts and be saved to disk. 
"
Class {
	#name : #GsScene,
	#superclass : #GsGroup,
	#category : #GameSketchLib
}

{ #category : #accessing }
GsScene >> initialize [
  super initialize.
  self constraintsDo: [ :c |
    c horizontal matchParent.
    c vertical matchParent ];
  background: GsColors defaultBg.
]
