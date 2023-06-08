Class {
	#name : #GsScene,
	#superclass : #GsObject,
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