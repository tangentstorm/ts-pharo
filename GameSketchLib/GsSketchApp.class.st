Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'sceneHolderHolder',
		'overlay'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #creation }
GsSketchApp class >> for: aScene [
  ^ self new scene: aScene 
]

{ #category : #accessing }
GsSketchApp >> makeOverlay [
  ^ overlay := GsToolOverlay new scene: scene
]

{ #category : #accessing }
GsSketchApp >> makeTools [
  ^ { GsSelectTool new.
      GsPenTool new}
]

{ #category : #accessing }
GsSketchApp >> makeUI [
  ui := super makeUI.
  appArea addChild: self makeOverlay as: #overlay.
  ^ ui
]

{ #category : #accessing }
GsSketchApp >> scene: aScene [
  super scene: aScene.
  overlay scene: aScene.
]
