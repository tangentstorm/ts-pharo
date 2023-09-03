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
		'selection',
		'inspector',
		'leftDock',
		'rightDock',
		'dockHolder'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsToolApp >> addTool: aTool [
  tools add: (aTool
    sceneBuilder: sceneBuilder;
    selection: selection;
    overlay: overlay;
    addedToApp: self).
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
  selection scene: scene.
  self currentTool: tools first.
]

{ #category : #'gsl - ui' }
GsToolApp >> makeAppArea [
  ^ appArea := GsObject new matchParent
    background: GsColor toolBg.
]

{ #category : #'gsl - ui' }
GsToolApp >> makeButtonFor: t [
  ^ BrButton new
    aptitude: BrMaterialToggleLabelledAptitude;
	label: t label;
	action: [ self currentTool: t ].
]

{ #category : #'gsl - ui' }
GsToolApp >> makeDockHolder [
  ^ BrHorizontalPane new matchParent background: GsColor toolBg
]

{ #category : #accessing }
GsToolApp >> makeInspector [
  inspector := GsInspector new relocate: 50@50.
  selection whenChangedDo: [inspector inspectSelection: selection].
  ^ inspector
]

{ #category : #accessing }
GsToolApp >> makeOverlay [
  ^ overlay := GsToolOverlay new
    scene: scene;
    tool: tools first
]

{ #category : #'gsl - ui' }
GsToolApp >> makePanelOverlay [
  ^ BrWidgetContainer new  matchParent 
    constraintsDo: [:c| c ignoreByLayout];
    relocate: 0@0
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
  ^ ui := BrVerticalPane new matchParent
    background: GsColor toolBg;
    addChild: self makeToolbar as: #toolbar;
    addChild: (dockHolder := GsDockContainer
      around: (self makeAppArea id: #appArea;
        addChild: self makeSceneHolder as: #sceneHolder;
        addChild: self makeOverlay as: #overlay))
    as: #dockHolder.
]

{ #category : #'gsl - ui' }
GsToolApp >> newDock [
  ^ BrVerticalFlow new hFitContent vMatchParent
]

{ #category : #accessing }
GsToolApp >> scene: aScene [
  super scene: aScene.
  sceneBuilder scene: aScene.
  selection scene: aScene.
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
