Class {
	#name : #GsColorChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'color'
	],
	#category : #'GameSketchLib-Events'
}

{ #category : #accessing }
GsColorChangedEvent >> color [
	^ color
]

{ #category : #accessing }
GsColorChangedEvent >> color: anObject [
	color := anObject
]
