Class {
	#name : #BexGraphTool,
	#superclass : #GsGraphTool,
	#instVars : [
		'sym'
	],
	#category : #'Bex-Drawing'
}

{ #category : #accessing }
BexGraphTool >> ensureNodeAt: aPoint [
  ^ self scene childAtPoint: aPoint where: [:child|
      child isKindOf: BexShape] 
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
  node := BexShape symbol: sym.
  self scene addChild: node.
  ^ node relocate: aPoint - (20@20).
]

{ #category : #accessing }
BexGraphTool >> symbol [
  ^ sym
]

{ #category : #accessing }
BexGraphTool >> symbol: aSymbol [
  sym := aSymbol
]
