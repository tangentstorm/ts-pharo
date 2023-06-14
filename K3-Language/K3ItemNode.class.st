Class {
	#name : #K3ItemNode,
	#superclass : #K3StartNode,
	#instVars : [
		'primToken',
		'nums',
		'number',
		'syms',
		'symbolToken',
		'stringToken',
		'leftParenToken',
		'block',
		'rightParenToken',
		'ifLeftBracketToken',
		'rightBracketToken',
		'whileLeftBracketToken',
		'doLeftBracketToken',
		'lv',
		'op',
		'expr'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3ItemNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitItem: self
]

{ #category : #generated }
K3ItemNode >> block [
	^ block
]

{ #category : #generated }
K3ItemNode >> block: aK3BlockNode [
	self block notNil ifTrue: [ self block parent: nil ].
	block := aK3BlockNode.
	self block notNil ifTrue: [ self block parent: self ]
]

{ #category : #generated }
K3ItemNode >> compositeNodeVariables [
	^ #(#nums #syms)
]

{ #category : #generated }
K3ItemNode >> doLeftBracketToken [
	^ doLeftBracketToken
]

{ #category : #generated }
K3ItemNode >> doLeftBracketToken: aSmaCCToken [
	doLeftBracketToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> expr [
	^ expr
]

{ #category : #generated }
K3ItemNode >> expr: aK3ChainNode [
	self expr notNil ifTrue: [ self expr parent: nil ].
	expr := aK3ChainNode.
	self expr notNil ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
K3ItemNode >> ifLeftBracketToken [
	^ ifLeftBracketToken
]

{ #category : #generated }
K3ItemNode >> ifLeftBracketToken: aSmaCCToken [
	ifLeftBracketToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
K3ItemNode >> initialize [
	super initialize.
	nums := OrderedCollection new: 2.
	syms := OrderedCollection new: 2.
]

{ #category : #generated }
K3ItemNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
K3ItemNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> lv [
	^ lv
]

{ #category : #generated }
K3ItemNode >> lv: anObject [
	self setParent: self lv to: nil.
	lv := anObject.
	self setParent: self lv to: self
]

{ #category : #generated }
K3ItemNode >> nodeVariables [
	^ #(#block #expr)
]

{ #category : #generated }
K3ItemNode >> number [
	^ number
]

{ #category : #generated }
K3ItemNode >> number: aSmaCCToken [
	number := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> nums [
	^ nums
]

{ #category : #generated }
K3ItemNode >> nums: anOrderedCollection [
	self setParents: self nums to: nil.
	nums := anOrderedCollection.
	self setParents: self nums to: self
]

{ #category : #generated }
K3ItemNode >> op [
	^ op
]

{ #category : #generated }
K3ItemNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> otherVariables [
	^ #(#lv)
]

{ #category : #generated }
K3ItemNode >> primToken [
	^ primToken
]

{ #category : #generated }
K3ItemNode >> primToken: aSmaCCToken [
	primToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
K3ItemNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
K3ItemNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
K3ItemNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> symbolToken [
	^ symbolToken
]

{ #category : #generated }
K3ItemNode >> symbolToken: aSmaCCToken [
	symbolToken := aSmaCCToken
]

{ #category : #generated }
K3ItemNode >> syms [
	^ syms
]

{ #category : #generated }
K3ItemNode >> syms: anOrderedCollection [
	self setParents: self syms to: nil.
	syms := anOrderedCollection.
	self setParents: self syms to: self
]

{ #category : #generated }
K3ItemNode >> tokenVariables [
	^ #(#primToken #number #symbolToken #stringToken #leftParenToken #rightParenToken #ifLeftBracketToken #rightBracketToken #whileLeftBracketToken #doLeftBracketToken #op)
]

{ #category : #generated }
K3ItemNode >> whileLeftBracketToken [
	^ whileLeftBracketToken
]

{ #category : #generated }
K3ItemNode >> whileLeftBracketToken: aSmaCCToken [
	whileLeftBracketToken := aSmaCCToken
]
