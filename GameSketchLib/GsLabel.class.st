Class {
	#name : #GsLabel,
	#superclass : #BrLabel,
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsLabel >> initialize [
  super initialize.
  self addAptitude: BrGlamorousLabelAptitude new
]
