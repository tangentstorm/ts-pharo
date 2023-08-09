"
I am an application for displaying and editing a {{gtClass:GsScene}}.

"
Class {
	#name : #GsApp,
	#superclass : #Object,
	#instVars : [
		'scene',
		'ui',
		'tools',
		'currentTool',
		'sceneHolder'
	],
	#category : #GameSketchLib
}

{ #category : #'gt inspector' }
GsApp >> asElement [
  ^ ui
]

{ #category : #'as yet unclassified' }
GsApp >> currentTool [
	^ currentTool
]

{ #category : #'as yet unclassified' }
GsApp >> currentTool: anObject [
	currentTool := anObject
]

{ #category : #'gt inspector' }
GsApp >> gtLiveFor: aView [
  <gtView>
^ aView explicit
  title: 'Live';
  priority: 10;
  stencil: [self ui]
]

{ #category : #'gt inspector' }
GsApp >> gtRunButtonFor: anAction [
  <gtAction>
^ anAction button
  icon: BrGlamorousVectorIcons play;
  action: [ :aButton |
    aButton phlow spawnObject: self class new];
  yourself
]

{ #category : #initialization }
GsApp >> initialize [
  tools := self makeTools.
  scene := self makeStartScene.
  self makeUI.
]

{ #category : #'gsl - ui' }
GsApp >> makeSceneHolder [
  "note: I removed BrHorizontalPane so the scene editor overlays can work for pileup, etc."
  ^ sceneHolder :=
    GsObject new matchParent
      addChild: scene
      "alignCenter"
]

{ #category : #'gsl - ui' }
GsApp >> makeStartScene [
 ^ GsScene new
]

{ #category : #'gsl - ui' }
GsApp >> makeToolbar [
  |tb|
  tb :=  BrToolbar new
    aptitude: BrMaterialToolbarAptitude.
  tools do: [:t |
    tb addItem: (BrButton new 
      aptitude: BrMaterialToggleLabelledAptitude;
      label: t label; 
      action: [ t makeCurrentFor: self ])].
^ tb.
]

{ #category : #'as yet unclassified' }
GsApp >> makeTools [
  ^ {GsSelectTool new}
]

{ #category : #'gsl - ui' }
GsApp >> makeUI [
ui := BrVerticalPane new
  constraintsDo: [ :c |
    c horizontal matchParent.
	c vertical matchParent ];
  background: GsColor toolBg;
  addChild: self makeToolbar as: #toolbar;
  addChild: self makeSceneHolder as: #sceneHolder.
^ ui
]

{ #category : #accessing }
GsApp >> scene [
	^ scene
]

{ #category : #accessing }
GsApp >> scene: aScene [
	scene := aScene.
	sceneHolder removeChildNamed: #scene.
	sceneHolder addChild: scene as: #scene.	
]

{ #category : #accessing }
GsApp >> ui [
	^ ui
]
