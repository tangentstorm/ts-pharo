"
I allow panning and (eventually) zooming the scene.

I am the default {{gtMethod:GsToolOverlay>>middleTool}} added by {{gtMethod:GsToolApp>>initialize}}
"
Class {
	#name : #GsViewportTool,
	#superclass : #GsTool,
	#instVars : [
		'dragOffset'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsViewportTool >> dragStart: aPoint [
  dragOffset := aPoint.
]

{ #category : #accessing }
GsViewportTool >> dragStep: aPoint [
  "the point is always relative to the scene's current position,
   so the distance to move is how far that relative point has
   moved from the original relative point, which is 'offset'"
  self scene gsMoveBy: aPoint - dragOffset.
]
