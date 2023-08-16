"
I allow selecting objects in a {{gtClass:GsSketch}}, either by clicking on them, or by dragging on the canvas to manipulate a {{gtClass:GsSelectangle}}.
"
Class {
	#name : #GsSelectTool,
	#superclass : #GsTool,
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsSelectTool >> label [
  ^ 'select'
]
