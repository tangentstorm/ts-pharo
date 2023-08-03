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
