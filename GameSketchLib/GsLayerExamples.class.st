Class {
	#name : #GsLayerExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsLayerExamples >> layer [
  <gtExample>
  |res|
  res := GsLayer new.
  self assert: res childOrigin equals: 0@0.
  self assert: res scaleFactor equals: 1.
  ^ res
]
