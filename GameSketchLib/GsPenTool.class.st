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
  path ifNil: [
    path := sceneBuilder shapeClass: GsPathShape;
      newAtPoint: aPoint].
  path addPoint: aPoint.
  overlay removeChildren; addChildren: path gsHandles
]
