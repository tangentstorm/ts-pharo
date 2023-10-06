"
I (will be) a tool for building graphs, using {{gtClass:GsEdgeShape}}
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
  self newNodeAt: aPoint
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
  (newEdge src = newEdge dst) ifTrue: [ newEdge removeFromParent ]
    ifFalse: [self scene add: newEdge toList: #edges].
  handle removeFromParent.
  selection reset add: newEdge
]

{ #category : #accessing }
GsGraphTool >> edgeClass [
  ^ GsEdgeShape
]

{ #category : #accessing }
GsGraphTool >> ensureNodeAt: aPoint [
  ^ self scene childAtPoint: aPoint where: [:child|
      child isKindOf: GsNodeShape] 
    ifNone: [ self newNodeAt: aPoint ]
]

{ #category : #accessing }
GsGraphTool >> makeHandleAt: aPoint [
  handle := GsHandle new relocate: aPoint.
  overlay addGizmo: handle.
  ^ handle
]

{ #category : #accessing }
GsGraphTool >> makeNewEdgeFrom: aNodeShape [
  newEdge := self edgeClass new
    src: aNodeShape;
    dst: handle.
  self scene addChild: newEdge as: sceneBuilder nextId.
]

{ #category : #accessing }
GsGraphTool >> newNodeAt: aPoint [ 
  |node|
  node := GsNodeShape new gsPosition: aPoint.
  self scene addChild: node as: sceneBuilder nextId.
  ^ node
]
