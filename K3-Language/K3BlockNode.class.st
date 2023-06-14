Class {
	#name : #K3BlockNode,
	#superclass : #K3StartNode,
	#instVars : [
		'lines',
		'stmts'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3BlockNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitBlock: self
]

{ #category : #generated }
K3BlockNode >> compositeNodeVariables [
	^ #(#lines)
]

{ #category : #'generated-initialize-release' }
K3BlockNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
]

{ #category : #generated }
K3BlockNode >> lines [
	^ lines
]

{ #category : #generated }
K3BlockNode >> lines: anOrderedCollection [
	self setParents: self lines to: nil.
	lines := anOrderedCollection.
	self setParents: self lines to: self
]

{ #category : #generated }
K3BlockNode >> nodeVariables [
	^ #(#stmts)
]

{ #category : #generated }
K3BlockNode >> stmts [
	^ stmts
]

{ #category : #generated }
K3BlockNode >> stmts: aK3StmtsNode [
	self stmts notNil ifTrue: [ self stmts parent: nil ].
	stmts := aK3StmtsNode.
	self stmts notNil ifTrue: [ self stmts parent: self ]
]
