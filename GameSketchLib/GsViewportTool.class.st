"
I allow panning and (eventually) zooming the scene.

I am the default {{gtMethod:GsToolOverlay>>middleTool}} added by {{gtMethod:GsToolApp>>initialize}}
"
Class {
	#name : #GsViewportTool,
	#superclass : #GsTool,
	#instVars : [
		'sceneHolder',
		'dragStartPoint',
		'initialOrigin'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsViewportTool >> dragEnd: aPoint [
  self dragStep: aPoint
]

{ #category : #accessing }
GsViewportTool >> dragStart: aPoint [
  dragStartPoint := aPoint.
  initialOrigin := sceneHolder childOrigin
]

{ #category : #accessing }
GsViewportTool >> dragStep: aPoint [
  sceneHolder childOrigin: 
    (sceneHolder childOrigin + (aPoint - dragStartPoint)).
  self updateOverlay
]

{ #category : #accessing }
GsViewportTool >> mouseWheel: aPoint [
  (aPoint y > 0)
    ifTrue: [sceneHolder zoomIn]
    ifFalse: [sceneHolder zoomOut].
  self updateOverlay
]

{ #category : #initialization }
GsViewportTool >> sceneHolder: aSceneHolder [
  sceneHolder := aSceneHolder
]

{ #category : #accessing }
GsViewportTool >> updateOverlay [
   overlay gizmoTransformation:
     sceneHolder childrenTransformation
]

{ #category : #initialization }
GsViewportTool >> wantsWheel [
  ^ true
]
