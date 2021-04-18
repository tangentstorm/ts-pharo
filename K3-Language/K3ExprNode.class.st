Class {
	#name : #K3ExprNode,
	#superclass : #K3StartNode,
	#instVars : [
		'identTokens',
		'advTokens',
		'primTokens',
		'builtinTokens',
		'strTokens',
		'numTokens',
		'symTokens',
		'leftParenTokens',
		'nlTokens',
		'commentTokens',
		'cmdTokens',
		'semicolonTokens',
		'ifLeftBracketTokens',
		'rightBracketTokens',
		'doLeftBracketTokens',
		'whileLeftBracketTokens',
		'rightParenTokens',
		'periodLeftParenTokens',
		'colonTokens',
		'leftBracketTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'colonLeftBracketTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3ExprNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitExpr: self
]

{ #category : #generated }
K3ExprNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3ExprNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3ExprNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3ExprNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3ExprNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3ExprNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> commentTokens [
	^ commentTokens
]

{ #category : #generated }
K3ExprNode >> commentTokens: anOrderedCollection [
	commentTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> compositeTokenVariables [
	^ #(#identTokens #advTokens #primTokens #builtinTokens #strTokens #numTokens #symTokens #leftParenTokens #nlTokens #commentTokens #cmdTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #rightParenTokens #periodLeftParenTokens #colonTokens #leftBracketTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3ExprNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3ExprNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3ExprNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3ExprNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3ExprNode >> initialize [
	super initialize.
	identTokens := OrderedCollection new: 2.
	advTokens := OrderedCollection new: 2.
	primTokens := OrderedCollection new: 2.
	builtinTokens := OrderedCollection new: 2.
	strTokens := OrderedCollection new: 2.
	numTokens := OrderedCollection new: 2.
	symTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	nlTokens := OrderedCollection new: 2.
	commentTokens := OrderedCollection new: 2.
	cmdTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	ifLeftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	doLeftBracketTokens := OrderedCollection new: 2.
	whileLeftBracketTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	periodLeftParenTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	colonLeftBracketTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3ExprNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3ExprNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3ExprNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3ExprNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3ExprNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3ExprNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3ExprNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3ExprNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3ExprNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3ExprNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3ExprNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3ExprNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3ExprNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3ExprNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3ExprNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3ExprNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
