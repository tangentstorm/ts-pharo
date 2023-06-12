Class {
	#name : #GsTool,
	#superclass : #Object,
	#instVars : [
		'startPoint'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #'as yet unclassified' }
GsTool >> label [
  ^ self class name
]

{ #category : #'as yet unclassified' }
GsTool >> onToolbarClick: anApp [
  anApp currentTool: self
]
