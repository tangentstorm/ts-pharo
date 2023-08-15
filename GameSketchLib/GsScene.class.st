Class {
	#name : #GsScene,
	#superclass : #GsSketch,
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsScene >> initialize [
  super initialize.
  self matchParent background: GsColor defaultBg
]
