"
I decorate  a {{gtClass:GsScene}} with a {{gtClass:GsTool}}and a selection, as well as a special ""glass"" layer for providing ""design time"" UI decorations.

"
Class {
	#name : #GsSketch,
	#superclass : #GsObject,
	#instVars : [
		'scene',
		'tool',
		'selection'
	],
	#category : #GameSketchLib
}

{ #category : #initialization }
GsSketch >> initialize [
	super initialize.
	self matchParent.
	self background: GsColors defaultBg
]

{ #category : #accessing }
GsSketch >> scene [
	^ scene
]

{ #category : #accessing }
GsSketch >> scene: anObject [
	scene := anObject
]

{ #category : #accessing }
GsSketch >> selection [
	^ selection
]

{ #category : #accessing }
GsSketch >> selection: anObject [
	selection := anObject
]

{ #category : #accessing }
GsSketch >> tool [
	^ tool
]

{ #category : #accessing }
GsSketch >> tool: anObject [
	tool := anObject
]
