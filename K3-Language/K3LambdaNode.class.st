Class {
	#name : #K3LambdaNode,
	#superclass : #K3StartNode,
	#instVars : [
		'leftBraceTokens',
		'nlTokens',
		'commentTokens',
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
		'colonTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBracketTokens',
		'numTokens',
		'symTokens',
		'periodLeftParenTokens',
		'rightBraceTokens',
		'colonLeftBracketTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3LambdaNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLambda: self
]

{ #category : #generated }
K3LambdaNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3LambdaNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3LambdaNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3LambdaNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3LambdaNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3LambdaNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> commentTokens [
	^ commentTokens
]

{ #category : #generated }
K3LambdaNode >> commentTokens: anOrderedCollection [
	commentTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> compositeTokenVariables [
	^ #(#leftBraceTokens #nlTokens #commentTokens #cmdTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #leftParenTokens #rightParenTokens #leftBracketTokens #numTokens #symTokens #periodLeftParenTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3LambdaNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3LambdaNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3LambdaNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3LambdaNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3LambdaNode >> initialize [
	super initialize.
	leftBraceTokens := OrderedCollection new: 2.
	nlTokens := OrderedCollection new: 2.
	commentTokens := OrderedCollection new: 2.
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
	rightBraceTokens := OrderedCollection new: 2.
	colonLeftBracketTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3LambdaNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3LambdaNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3LambdaNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3LambdaNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3LambdaNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3LambdaNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3LambdaNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3LambdaNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3LambdaNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3LambdaNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3LambdaNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3LambdaNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3LambdaNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3LambdaNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3LambdaNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3LambdaNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
