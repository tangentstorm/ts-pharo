Class {
	#name : #K3DefNode,
	#superclass : #K3StartNode,
	#instVars : [
		'identTokens',
		'colonTokens',
		'advTokens',
		'primTokens',
		'builtinTokens',
		'strTokens',
		'leftParenTokens',
		'rightParenTokens',
		'numTokens',
		'symTokens',
		'periodLeftParenTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'colonLeftBracketTokens',
		'rightBracketTokens',
		'leftBracketTokens',
		'nlTokens',
		'cmtTokens',
		'cmdTokens',
		'semicolonTokens',
		'ifLeftBracketTokens',
		'doLeftBracketTokens',
		'whileLeftBracketTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3DefNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitDef: self
]

{ #category : #generated }
K3DefNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3DefNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3DefNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3DefNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> cmtTokens [
	^ cmtTokens
]

{ #category : #generated }
K3DefNode >> cmtTokens: anOrderedCollection [
	cmtTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3DefNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3DefNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> compositeTokenVariables [
	^ #(#identTokens #colonTokens #advTokens #primTokens #builtinTokens #strTokens #numTokens #symTokens #leftParenTokens #nlTokens #cmtTokens #cmdTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #rightParenTokens #periodLeftParenTokens #leftBracketTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3DefNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3DefNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3DefNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3DefNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3DefNode >> initialize [
	super initialize.
	identTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	advTokens := OrderedCollection new: 2.
	primTokens := OrderedCollection new: 2.
	builtinTokens := OrderedCollection new: 2.
	strTokens := OrderedCollection new: 2.
	numTokens := OrderedCollection new: 2.
	symTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	nlTokens := OrderedCollection new: 2.
	cmtTokens := OrderedCollection new: 2.
	cmdTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	ifLeftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	doLeftBracketTokens := OrderedCollection new: 2.
	whileLeftBracketTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	periodLeftParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	colonLeftBracketTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3DefNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3DefNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3DefNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3DefNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3DefNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3DefNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3DefNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3DefNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3DefNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3DefNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3DefNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3DefNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3DefNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3DefNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3DefNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3DefNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
