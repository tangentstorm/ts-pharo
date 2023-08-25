"
I create a text shape when the canvas is clicked.

Probably, I should also enable some knid of text toolbar.


"
Class {
	#name : #GsTextTool,
	#superclass : #GsTool,
	#category : #'GameSketchLib-Tools'
}

{ #category : #'event handling' }
GsTextTool >> click: aPoint [
  scene addChild: (GsTextShape new
    shapePosition: aPoint).
]
