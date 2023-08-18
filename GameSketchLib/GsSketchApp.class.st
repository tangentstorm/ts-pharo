Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'editor',
		'sceneHolderHolder'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #creation }
GsSketchApp class >> for: aScene [
  ^ self new scene: aScene 
]

{ #category : #accessing }
GsSketchApp >> makeEditor [
  ^ editor := GsSceneEditor for: scene
]

{ #category : #accessing }
GsSketchApp >> makeTools [
  ^ { GsSelectTool new.
      GsPenTool new}
]

{ #category : #accessing }
GsSketchApp >> makeUI [
  ui := super makeUI.
  appArea addChild: self makeEditor as: #editor.
  ^ ui
]

{ #category : #accessing }
GsSketchApp >> scene: aScene [
  super scene: aScene.
  editor scene: aScene.
]
