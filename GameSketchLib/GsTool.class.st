"
I process mouse events from a {{gtClass:GsToolOverlay}} 
and manipulate a {{gtClass:GsScene}}

I represent some a of tool for manipulating a scene in a {{gtClass:GsToolApp}}

See my subclasses for concrete instances.

"
Class {
	#name : #GsTool,
	#superclass : #Object,
	#instVars : [
		'startPoint',
		'scene',
		'overlay'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #'event handling' }
GsTool >> click: aPoint [
]

{ #category : #'event handling' }
GsTool >> dragEnd: aPoint [
]

{ #category : #'event handling' }
GsTool >> dragStart: aPoint [
  startPoint := aPoint
]

{ #category : #'event handling' }
GsTool >> dragStep: aPoint [
]

{ #category : #accessing }
GsTool >> label [
  ^ self class name splitCamelCase second asLowercase
]

{ #category : #'event handling' }
GsTool >> move: aPoint [
]

{ #category : #accessing }
GsTool >> overlay: anObject [
	overlay := anObject
]

{ #category : #accessing }
GsTool >> scene [
	^ scene
]

{ #category : #accessing }
GsTool >> scene: aScene [
	scene := aScene
]
