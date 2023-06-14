Class {
	#name : #K3StmtsNode,
	#superclass : #K3StartNode,
	#instVars : [
		'semicolonTokens',
		'exprs'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3StmtsNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitStmts: self
]

{ #category : #generated }
K3StmtsNode >> compositeNodeVariables [
	^ #(#exprs)
]

{ #category : #generated }
K3StmtsNode >> compositeTokenVariables [
	^ #(#semicolonTokens)
]

{ #category : #generated }
K3StmtsNode >> exprs [
	^ exprs
]

{ #category : #generated }
K3StmtsNode >> exprs: anOrderedCollection [
	self setParents: self exprs to: nil.
	exprs := anOrderedCollection.
	self setParents: self exprs to: self
]

{ #category : #'generated-initialize-release' }
K3StmtsNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	exprs := OrderedCollection new: 2.
]

{ #category : #generated }
K3StmtsNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3StmtsNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]
