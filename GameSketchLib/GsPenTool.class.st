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
  |nudge | nudge := self scene position.
  path ifNil: [
    path := sceneBuilder shapeClass: GsPathShape; newAtPoint: aPoint].
  path addPoint: aPoint.
  overlay removeChildren; addGizmos: path gsHandles.
]
