"
An {{gtClass:GsToolApp}} for drawing scenes.

Collaborators: {{gtClass:GsSelectTool}} {{gtClass:GsBuildTool}} {{gtClass:GsSelection}} {{gtClass:GsToolOverlay}}
"
Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'palette',
		'arranger',
		'animationPanel'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #creation }
GsSketchApp class >> for: aScene [
  ^ self new scene: aScene
]

{ #category : #ui }
GsSketchApp >> initialTools [
  ^ { GsSelectTool new.
      GsBuildTool for: GsRectShape.
      GsBuildTool for: GsCircleShape.
      GsPenTool new.
      GsTextTool new}
]

{ #category : #ui }
GsSketchApp >> makeAnimationPanel [
  ^ animationPanel := GsAnimationPanel new
    sketch: scene;
    selection: selection
]

{ #category : #ui }
GsSketchApp >> makeArrangePanel [
  ^ arranger := GsArrangePanel new
    selection: selection.
]

{ #category : #ui }
GsSketchApp >> makePalette [
  ^ GsPaletteElement new
    when: GsColorChangedEvent do: [:e|
      sceneBuilder background: e color.
      self selection do: [:each | each background: e color]]
]

{ #category : #ui }
GsSketchApp >> makeUI [
  ui := super makeUI.
  dockHolder
    addDockable: self makeInspector as: #inspector in: #rightDock;
    addDockable: self makeArrangePanel as: #arranger in: #rightDock;
    addDockable: self makeAnimationPanel as: #animations in: #bottomDock.
  toolbar addChild: (self makePalette).
  ^ ui
]
