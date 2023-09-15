"
I bind a {{gtClass:GsTimelineElement}}  to a {{gtClass:GsScene}} and update the scene when the timeline's playhead moves to a new frame.

"
Class {
	#name : #GsPlayerApp,
	#superclass : #GsToolApp,
	#instVars : [
		'timeline',
		'frameCounter',
		'trackSetters',
		'animationPanel'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #initialization }
GsPlayerApp >> makeAnimationPanel [
  ^ animationPanel := GsAnimationPanel new
]

{ #category : #initialization }
GsPlayerApp >> makeUI [
  ui := super makeUI.
  dockHolder
    addDockable: self makeAnimationPanel
    as: #animation in: #bottomDock.
  ^ ui
]

{ #category : #accessing }
GsPlayerApp >> scene: aSceneOrSketch [
  super scene: aSceneOrSketch.
  animationPanel sketch: aSceneOrSketch.
]
