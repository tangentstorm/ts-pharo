Class {
	#name : #K3CodeItemNode,
	#superclass : #K3StartNode,
	#instVars : [
		'commentTokens',
		'semicolonTokens',
		'ifLeftBracketTokens',
		'rightBracketTokens',
		'doLeftBracketTokens',
		'whileLeftBracketTokens',
		'nlTokens',
		'identTokens',
		'advTokens',
		'primTokens',
		'builtinTokens',
		'strTokens',
		'colonTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBracketTokens',
		'cmdTokens',
		'numTokens',
		'symTokens',
		'periodLeftParenTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'colonLeftBracketTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3CodeItemNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCodeItem: self
]

{ #category : #generated }
K3CodeItemNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3CodeItemNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3CodeItemNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3CodeItemNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3CodeItemNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> commentTokens [
	^ commentTokens
]

{ #category : #generated }
K3CodeItemNode >> commentTokens: anOrderedCollection [
	commentTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> compositeTokenVariables [
	^ #(#commentTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #nlTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #leftParenTokens #rightParenTokens #leftBracketTokens #cmdTokens #numTokens #symTokens #periodLeftParenTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3CodeItemNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3CodeItemNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3CodeItemNode >> initialize [
	super initialize.
	commentTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	ifLeftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	doLeftBracketTokens := OrderedCollection new: 2.
	whileLeftBracketTokens := OrderedCollection new: 2.
	nlTokens := OrderedCollection new: 2.
	identTokens := OrderedCollection new: 2.
	advTokens := OrderedCollection new: 2.
	primTokens := OrderedCollection new: 2.
	builtinTokens := OrderedCollection new: 2.
	strTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	cmdTokens := OrderedCollection new: 2.
	numTokens := OrderedCollection new: 2.
	symTokens := OrderedCollection new: 2.
	periodLeftParenTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	colonLeftBracketTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3CodeItemNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3CodeItemNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3CodeItemNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3CodeItemNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3CodeItemNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3CodeItemNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3CodeItemNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3CodeItemNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3CodeItemNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3CodeItemNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3CodeItemNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3CodeItemNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeItemNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3CodeItemNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
