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
GsSketchApp >> makePalette [
  ^ GsPaletteElement new
    when: GsColorChangedEvent do: [:e|
      sceneBuilder background: e color.
      self selection do: [:each | each background: e color]]
]

{ #category : #ui }
GsSketchApp >> makeTools [
  ^ { GsSelectTool new.
      GsBuildTool for: GsRectShape.
      GsBuildTool for: GsCircleShape.
      GsBuildTool for: GsLineShape.
      GsTextTool new.}
]

{ #category : #ui }
GsSketchApp >> makeUI [
  ui := super makeUI.
  toolbar addChild: (self makePalette).
  ^ ui
]

{ #category : #accessing }
GsSketchApp >> selectangle [
  ^ self tools first selectangle
]

{ #category : #ui }
GsSketchApp >> selection [
  ^ self tools first selection
]
