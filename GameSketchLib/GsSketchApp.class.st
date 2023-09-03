"
An {{gtClass:GsToolApp}} for drawing scenes.

Collaborators: {{gtClass:GsSelectTool}} {{gtClass:GsBuildTool}} {{gtClass:GsSelection}} {{gtClass:GsToolOverlay}}
"
Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'palette',
		'arranger'
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
    addChild: self makeInspector as: #inspector;
    addChild: self makeArrangePanel as: #arranger.
  { inspector. arranger} do: [:each | each dockIn: #rightDock ].
  toolbar addChild: (self makePalette).
  ^ ui
]
