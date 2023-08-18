"
I process mouse events and manipulate a {{gtClass:GsScene}}

I represent some a of tool for manipulating a scene in a {{gtClass:GsSceneEditor}}

Currently {{gtClass:GsApp}}seems to be what creates me.


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

{ #category : #'as yet unclassified' }
GsTool >> label [
  ^ self class name
]

{ #category : #'as yet unclassified' }
GsTool >> makeCurrentFor: anApp [
  anApp currentTool: self
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

{ #category : #accessing }
GsTool >> startPoint [
	^ startPoint
]

{ #category : #accessing }
GsTool >> startPoint: anObject [
	startPoint := anObject
]
