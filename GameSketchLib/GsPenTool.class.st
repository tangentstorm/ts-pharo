"
I (will be ) a tool for drawing freeform curves.
"
Class {
	#name : #GsPenTool,
	#superclass : #GsTool,
	#instVars : [
		'path'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsPenTool >> click: aPoint [
  path
    ifNil: [path := sceneBuilder shapeClass: GsPathShape; newAtPoint: aPoint]
    ifNotNil: [ path addPoint: aPoint].
  overlay addChild: path handleForLastPoint.
]
