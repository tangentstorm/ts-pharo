Class {
	#name : #K3LineNode,
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
K3LineNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLine: self
]

{ #category : #generated }
K3LineNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3LineNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3LineNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3LineNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3LineNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3LineNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> commentTokens [
	^ commentTokens
]

{ #category : #generated }
K3LineNode >> commentTokens: anOrderedCollection [
	commentTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> compositeTokenVariables [
	^ #(#commentTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #nlTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #leftParenTokens #rightParenTokens #leftBracketTokens #cmdTokens #numTokens #symTokens #periodLeftParenTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3LineNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3LineNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3LineNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3LineNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3LineNode >> initialize [
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
K3LineNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3LineNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3LineNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3LineNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3LineNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3LineNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3LineNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3LineNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3LineNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3LineNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3LineNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3LineNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3LineNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3LineNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3LineNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3LineNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
