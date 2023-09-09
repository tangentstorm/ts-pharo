Class {
	#name : #PileupNavigateTool,
	#superclass : #GsTool,
	#instVars : [
		'app'
	],
	#category : #PileUp
}

{ #category : #accessing }
PileupNavigateTool >> app: aToolApp [
  app := aToolApp
]

{ #category : #accessing }
PileupNavigateTool >> click: aPoint [
  | el |
  el := self scene childAtPoint: aPoint
  ifNone: [^ self].
  el isPile ifTrue: [
    app spawnPile: el couchId]
  
]
