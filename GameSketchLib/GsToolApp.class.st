"
I am an application for displaying and editing a {{gtClass:GsScene}}.

I share a {{gtClass:GsSceneBuilder}} , {{gtClass:GsSelection}} , and {{gtClass:GsToolOverlay}} with one or more {{gtClass:GsTool}} objects to make this easier.

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
  tools add: (aTool
    sceneBuilder: sceneBuilder;
    selection: selection).
  toolbar addItem: (self makeButtonFor: aTool).
]

{ #category : #accessing }
GsToolApp >> currentTool [
  ^ overlay tool
]

{ #category : #accessing }
GsToolApp >> currentTool: aTool [
  overlay tool: aTool.
  aTool
    selection: selection;
    sceneBuilder: sceneBuilder.
  toolbar children do: [:c| c border: BlBorder empty].
  (toolbar childAt: (tools indexOf: aTool))
     border: Color darkGray.
]

{ #category : #initialization }
GsToolApp >> initialTools [
  ^ {GsSelectTool new}
]

{ #category : #initialization }
GsToolApp >> initialize [
  sceneBuilder := GsSceneBuilder new .
  selection := GsSelection new.
  tools := OrderedCollection new.
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
  toolbar := BrToolbar new
	aptitude: BrMaterialToolbarAptitude.
  self initialTools do: [:t| self addTool: t].
  ^ toolbar
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

{ #category : #ui }
GsToolApp >> selection [
  ^ selection
]

{ #category : #accessing }
GsToolApp >> tools [
  ^ tools
]
