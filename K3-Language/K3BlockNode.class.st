Class {
	#name : #K3BlockNode,
	#superclass : #K3StartNode,
	#instVars : [
		'nlTokens',
		'cmtTokens',
		'cmdTokens',
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
K3BlockNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitBlock: self
]

{ #category : #generated }
K3BlockNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3BlockNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3BlockNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3BlockNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> cmtTokens [
	^ cmtTokens
]

{ #category : #generated }
K3BlockNode >> cmtTokens: anOrderedCollection [
	cmtTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3BlockNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3BlockNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> compositeTokenVariables [
	^ #(#nlTokens #cmtTokens #cmdTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #leftParenTokens #rightParenTokens #leftBracketTokens #numTokens #symTokens #periodLeftParenTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3BlockNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3BlockNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3BlockNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3BlockNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3BlockNode >> initialize [
	super initialize.
	nlTokens := OrderedCollection new: 2.
	cmtTokens := OrderedCollection new: 2.
	cmdTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	ifLeftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	doLeftBracketTokens := OrderedCollection new: 2.
	whileLeftBracketTokens := OrderedCollection new: 2.
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
K3BlockNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3BlockNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3BlockNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3BlockNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3BlockNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3BlockNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3BlockNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3BlockNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3BlockNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3BlockNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3BlockNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3BlockNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3BlockNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3BlockNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3BlockNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3BlockNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
