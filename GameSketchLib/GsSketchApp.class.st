Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#category : #'GameSketchLib-Apps'
}

{ #category : #creation }
GsSketchApp class >> for: aScene [
  ^ self new scene: aScene
]

{ #category : #accessing }
GsSketchApp >> makeTools [
  ^ { GsSelectTool new.
      GsBuildTool for: GsRectShape.
      GsBuildTool for: GsCircleShape.
      GsBuildTool for: GsLineShape.
      GsTextTool new.}
]

{ #category : #accessing }
GsSketchApp >> makeUI [
  ui := super makeUI.
  toolbar addChild: "primitive color palette tool"
    (GsPalette arne gridWithSize: 14 onClick: [:color |
      self selection do: [:e | e background: color ]]).
  ^ ui
]

{ #category : #accessing }
GsSketchApp >> selection [
  ^ self tools first selection
]
