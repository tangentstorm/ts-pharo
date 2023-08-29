Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'palette'
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
      GsBuildTool for: GsLineShape.
      GsTextTool new.}
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
  toolbar addChild: (self makePalette).
  ^ ui
]

{ #category : #accessing }
GsSketchApp >> selectTool [
  ^ self tools
    detect: [:t| t isKindOf: GsSelectTool]
    ifNone: [ self error: 'no select tool found.']
]

{ #category : #accessing }
GsSketchApp >> selectangle [
  ^ self selectTool selectangle
]
