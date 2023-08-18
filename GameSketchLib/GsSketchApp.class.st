Class {
	#name : #GsSketchApp,
	#superclass : #GsToolApp,
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsSketchApp >> makeTools [
  ^ { GsSelectTool new.
      GsPenTool new}
]
