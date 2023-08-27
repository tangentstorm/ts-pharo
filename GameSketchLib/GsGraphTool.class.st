"
I (will be) a tool for building graphs.
"
Class {
	#name : #GsGraphTool,
	#superclass : #GsTool,
	#instVars : [
		'newEdge',
		'handle'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsGraphTool >> click: aPoint [
  scene addChild: (self newNodeAt: aPoint)
]

{ #category : #accessing }
GsGraphTool >> dragStart: aPoint [
  self makeHandleAt: aPoint.
  self makeNewEdgeFrom: (self ensureNodeAt: aPoint)
]

{ #category : #accessing }
GsGraphTool >> dragStep: aPoint [
  handle relocate: aPoint
]

{ #category : #accessing }
GsGraphTool >> dragStop: aPoint [
  newEdge dst: (self ensureNodeAt: aPoint).
  handle removeFromParent.
]

{ #category : #accessing }
GsGraphTool >> ensureNodeAt: aPoint [
  ^ scene childAtPoint: aPoint where: [:child|
      child isKindOf: GsNodeShape] 
    ifNone: [ self newNodeAt: aPoint ]
]

{ #category : #accessing }
GsGraphTool >> makeHandleAt: aPoint [
  handle := GsHandle new relocate: aPoint.
  overlay addChild: handle.
  ^ handle
]

{ #category : #accessing }
GsGraphTool >> makeNewEdgeFrom: aNodeShape [
  newEdge := GsEdgeShape new
    src: aNodeShape;
    dst: handle.
  scene addChild: newEdge.
]

{ #category : #accessing }
GsGraphTool >> newNodeAt: aPoint [ 
  |node|
  node := GsNodeShape new gsPosition: aPoint.
  scene addChild: node.
  ^ node
]
