"
I represent some a of tool in a {{gtClass:GsToolApp}}

I process mouse events from a {{gtClass:GsToolOverlay}} and manipulate a {{gtClass:GsScene}}

See my subclasses for concrete instances.

"
Class {
	#name : #GsTool,
	#superclass : #Object,
	#instVars : [
		'startPoint',
		'overlay',
		'sceneBuilder',
		'selection'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #initialization }
GsTool >> addedToApp: aToolApp [
  "override for tool-specific setup (like selectTool's selectangle)"
]

{ #category : #'event handling' }
GsTool >> click: aPoint [
]

{ #category : #'event handling' }
GsTool >> dragStart: aPoint [
  startPoint := aPoint
]

{ #category : #'event handling' }
GsTool >> dragStep: aPoint [
]

{ #category : #'event handling' }
GsTool >> dragStop: aPoint [
]

{ #category : #accessing }
GsTool >> label [
  ^ self class name splitCamelCase second asLowercase
]

{ #category : #accessing }
GsTool >> mouseWheel: aPoint [
  "allows scrolling on both axes.
   if you want your subclass to receive this,
   make wantsWheel return true.
   Only one tool can handle the mouse wheel."
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
	^ sceneBuilder scene
]

{ #category : #accessing }
GsTool >> sceneBuilder [
	^ sceneBuilder
]

{ #category : #accessing }
GsTool >> sceneBuilder: aSceneBuilder [
	sceneBuilder := aSceneBuilder
]

{ #category : #accessing }
GsTool >> selection [
  ^ selection
]

{ #category : #accessing }
GsTool >> selection: aSelection [
  selection := aSelection.
]

{ #category : #initialization }
GsTool >> wantsWheel [
  ^ false
]
