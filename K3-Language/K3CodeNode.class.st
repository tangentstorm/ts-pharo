Class {
	#name : #K3CodeNode,
	#superclass : #K3StartNode,
	#instVars : [
		'semicolonTokens',
		'ifLeftBracketTokens',
		'rightBracketTokens',
		'doLeftBracketTokens',
		'whileLeftBracketTokens',
		'identTokens',
		'advTokens',
		'primTokens',
		'builtinTokens',
		'strTokens',
		'leftParenTokens',
		'rightParenTokens',
		'nlTokens',
		'cmtTokens',
		'cmdTokens',
		'numTokens',
		'symTokens',
		'periodLeftParenTokens',
		'colonTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'colonLeftBracketTokens',
		'leftBracketTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3CodeNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCode: self
]

{ #category : #generated }
K3CodeNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3CodeNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3CodeNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3CodeNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> cmtTokens [
	^ cmtTokens
]

{ #category : #generated }
K3CodeNode >> cmtTokens: anOrderedCollection [
	cmtTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3CodeNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3CodeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> compositeTokenVariables [
	^ #(#semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #nlTokens #cmtTokens #cmdTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #leftParenTokens #rightParenTokens #leftBracketTokens #numTokens #symTokens #periodLeftParenTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3CodeNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3CodeNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3CodeNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3CodeNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3CodeNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	ifLeftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	doLeftBracketTokens := OrderedCollection new: 2.
	whileLeftBracketTokens := OrderedCollection new: 2.
	nlTokens := OrderedCollection new: 2.
	cmtTokens := OrderedCollection new: 2.
	cmdTokens := OrderedCollection new: 2.
	identTokens := OrderedCollection new: 2.
	advTokens := OrderedCollection new: 2.
	primTokens := OrderedCollection new: 2.
	builtinTokens := OrderedCollection new: 2.
	strTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	numTokens := OrderedCollection new: 2.
	symTokens := OrderedCollection new: 2.
	periodLeftParenTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	colonLeftBracketTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3CodeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3CodeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3CodeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3CodeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3CodeNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3CodeNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3CodeNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3CodeNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3CodeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3CodeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3CodeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3CodeNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3CodeNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3CodeNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3CodeNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3CodeNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
