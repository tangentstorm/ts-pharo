Class {
	#name : #BexGraphTool,
	#superclass : #GsGraphTool,
	#instVars : [
		'sym'
	],
	#category : #'Bex-Drawing'
}

{ #category : #accessing }
BexGraphTool >> edgeClass [
  ^ BexEdgeShape
]

{ #category : #accessing }
BexGraphTool >> ensureNodeAt: aPoint [
  ^ self scene childAtPoint: aPoint where: [:child|
      child isKindOf: BexNodeShape] 
    ifNone: [ self newNodeAt: aPoint ]
]

{ #category : #accessing }
BexGraphTool >> initialize [
  super initialize.
  sym := #x0.
]

{ #category : #accessing }
BexGraphTool >> newNodeAt: aPoint [
  | node |
  node := BexNodeShape symbol: sym.
  self scene addChild: node as: sceneBuilder nextId.
  ^ node relocate: aPoint - (20@20).
]

{ #category : #accessing }
BexGraphTool >> onNewEdgeComplete [
  super onNewEdgeComplete.
  (newEdge src) addEdge: newEdge to: (newEdge dst)
]

{ #category : #accessing }
BexGraphTool >> symbol [
  ^ sym
]

{ #category : #accessing }
BexGraphTool >> symbol: aSymbol [
  sym := aSymbol
]
