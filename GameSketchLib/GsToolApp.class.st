"
I am an application for displaying and editing a {{gtClass:GsScene}}.

"
Class {
	#name : #GsToolApp,
	#superclass : #GsApp,
	#instVars : [
		'tools',
		'appArea',
		'overlay',
		'toolbar',
		'sceneBuilder',
		'selection'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsToolApp >> addTool: aTool [
  aTool sceneBuilder: sceneBuilder.
  tools add: aTool.
  toolbar addItem: (self makeButtonFor: aTool).
]

{ #category : #accessing }
GsToolApp >> currentTool [
  ^ overlay tool
]

{ #category : #accessing }
GsToolApp >> currentTool: aTool [
  overlay tool: aTool.
  toolbar children do: [:c| c border: BlBorder empty].
  (toolbar childAt: (tools indexOf: aTool))
     border: Color darkGray.
]

{ #category : #initialization }
GsToolApp >> initialize [
  sceneBuilder := GsSceneBuilder new .
  tools := self makeTools.
  selection := {}.
  super initialize.
  sceneBuilder scene: scene.
  self makeToolbar.
  self currentTool: tools first
]

{ #category : #'gsl - ui' }
GsToolApp >> makeAppArea [
  ^ appArea := GsObject new matchParent
    background: GsColor toolBg;
    addChild: self makeSceneHolder as: #sceneHolder;
    addChild: self makeOverlay as: #overlay.
]

{ #category : #'gsl - ui' }
GsToolApp >> makeButtonFor: t [
  ^ BrButton new
    aptitude: BrMaterialToggleLabelledAptitude;
	label: t label;
	action: [ self currentTool: t ].
]

{ #category : #accessing }
GsToolApp >> makeOverlay [
  ^ overlay := GsToolOverlay new
    scene: scene;
    tool: tools first
]

{ #category : #'gsl - ui' }
GsToolApp >> makeToolbar [
  ^ toolbar := BrToolbar new
	aptitude: BrMaterialToolbarAptitude;
	addItems: (tools collect: [:t|
	   t sceneBuilder: sceneBuilder.
	   self makeButtonFor: t])
]

{ #category : #accessing }
GsToolApp >> makeTools [
  ^ {GsSelectTool new}
]

{ #category : #'gsl - ui' }
GsToolApp >> makeUI [
  ^ BrVerticalPane new matchParent
    background: GsColor toolBg;
    addChild: self makeToolbar as: #toolbar;
    addChild: self makeAppArea as: #appArea
]

{ #category : #accessing }
GsToolApp >> scene: aScene [
  super scene: aScene.
  sceneBuilder scene: aScene.
  overlay scene: aScene
]

{ #category : #accessing }
GsToolApp >> tools [
  ^ tools
]
