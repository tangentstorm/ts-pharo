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
      GsBuildTool for: GsLineShape.}
]
