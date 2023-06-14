Class {
	#name : #K3CodeNode,
	#superclass : #K3StartNode,
	#instVars : [
		'lines',
		'cmt',
		'stmts'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3CodeNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCode: self
]

{ #category : #generated }
K3CodeNode >> cmt [
	^ cmt
]

{ #category : #generated }
K3CodeNode >> cmt: aSmaCCToken [
	cmt := aSmaCCToken
]

{ #category : #generated }
K3CodeNode >> compositeNodeVariables [
	^ #(#lines)
]

{ #category : #'generated-initialize-release' }
K3CodeNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
]

{ #category : #generated }
K3CodeNode >> lines [
	^ lines
]

{ #category : #generated }
K3CodeNode >> lines: anOrderedCollection [
	self setParents: self lines to: nil.
	lines := anOrderedCollection.
	self setParents: self lines to: self
]

{ #category : #generated }
K3CodeNode >> nodeVariables [
	^ #(#stmts)
]

{ #category : #generated }
K3CodeNode >> stmts [
	^ stmts
]

{ #category : #generated }
K3CodeNode >> stmts: aK3StmtsNode [
	self stmts notNil ifTrue: [ self stmts parent: nil ].
	stmts := aK3StmtsNode.
	self stmts notNil ifTrue: [ self stmts parent: self ]
]

{ #category : #generated }
K3CodeNode >> tokenVariables [
	^ #(#cmt)
]
