Class {
	#name : #K3ListNode,
	#superclass : #K3StartNode,
	#instVars : [
		'leftParenTokens',
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
		'rightParenTokens',
		'leftBracketTokens',
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
K3ListNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitList: self
]

{ #category : #generated }
K3ListNode >> advTokens [
	^ advTokens
]

{ #category : #generated }
K3ListNode >> advTokens: anOrderedCollection [
	advTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> builtinTokens [
	^ builtinTokens
]

{ #category : #generated }
K3ListNode >> builtinTokens: anOrderedCollection [
	builtinTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> cmdTokens [
	^ cmdTokens
]

{ #category : #generated }
K3ListNode >> cmdTokens: anOrderedCollection [
	cmdTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> colonLeftBracketTokens [
	^ colonLeftBracketTokens
]

{ #category : #generated }
K3ListNode >> colonLeftBracketTokens: anOrderedCollection [
	colonLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
K3ListNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> commentTokens [
	^ commentTokens
]

{ #category : #generated }
K3ListNode >> commentTokens: anOrderedCollection [
	commentTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> compositeTokenVariables [
	^ #(#leftParenTokens #nlTokens #commentTokens #cmdTokens #semicolonTokens #ifLeftBracketTokens #rightBracketTokens #doLeftBracketTokens #whileLeftBracketTokens #identTokens #advTokens #primTokens #builtinTokens #strTokens #colonTokens #rightParenTokens #leftBracketTokens #numTokens #symTokens #periodLeftParenTokens #leftBraceTokens #rightBraceTokens #colonLeftBracketTokens)
]

{ #category : #generated }
K3ListNode >> doLeftBracketTokens [
	^ doLeftBracketTokens
]

{ #category : #generated }
K3ListNode >> doLeftBracketTokens: anOrderedCollection [
	doLeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> identTokens [
	^ identTokens
]

{ #category : #generated }
K3ListNode >> identTokens: anOrderedCollection [
	identTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> ifLeftBracketTokens [
	^ ifLeftBracketTokens
]

{ #category : #generated }
K3ListNode >> ifLeftBracketTokens: anOrderedCollection [
	ifLeftBracketTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
K3ListNode >> initialize [
	super initialize.
	leftParenTokens := OrderedCollection new: 2.
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
K3ListNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
K3ListNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
K3ListNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
K3ListNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> nlTokens [
	^ nlTokens
]

{ #category : #generated }
K3ListNode >> nlTokens: anOrderedCollection [
	nlTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3ListNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> periodLeftParenTokens [
	^ periodLeftParenTokens
]

{ #category : #generated }
K3ListNode >> periodLeftParenTokens: anOrderedCollection [
	periodLeftParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> primTokens [
	^ primTokens
]

{ #category : #generated }
K3ListNode >> primTokens: anOrderedCollection [
	primTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
K3ListNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
K3ListNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
K3ListNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3ListNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> strTokens [
	^ strTokens
]

{ #category : #generated }
K3ListNode >> strTokens: anOrderedCollection [
	strTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3ListNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]

{ #category : #generated }
K3ListNode >> whileLeftBracketTokens [
	^ whileLeftBracketTokens
]

{ #category : #generated }
K3ListNode >> whileLeftBracketTokens: anOrderedCollection [
	whileLeftBracketTokens := anOrderedCollection
]
