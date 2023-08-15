"
I am an application for displaying and editing a {{gtClass:GsScene}}.

"
Class {
	#name : #GsToolApp,
	#superclass : #GsApp,
	#instVars : [
		'tools',
		'currentTool'
	],
	#category : #GameSketchLib
}

{ #category : #'as yet unclassified' }
GsToolApp >> currentTool [
	^ currentTool
]

{ #category : #'as yet unclassified' }
GsToolApp >> currentTool: anObject [
	currentTool := anObject
]

{ #category : #initialization }
GsToolApp >> initialize [
  tools := self makeTools.
  super initialize.
]

{ #category : #'gsl - ui' }
GsToolApp >> makeToolbar [
  ^ BrToolbar new
    aptitude: BrMaterialToolbarAptitude;
    addItems: (tools collect: [:t | 
      BrButton new 
        aptitude: BrMaterialToggleLabelledAptitude;
        label: t label; 
        action: [ t makeCurrentFor: self ]])
]

{ #category : #'as yet unclassified' }
GsToolApp >> makeTools [
  ^ {GsSelectTool new}
]

{ #category : #'gsl - ui' }
GsToolApp >> makeUI [
  ^ BrVerticalPane new matchParent
    background: GsColor toolBg;
    addChild: self makeToolbar as: #toolbar;
    addChild: self makeSceneHolder as: #sceneHolder.
]
