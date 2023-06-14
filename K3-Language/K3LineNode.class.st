Class {
	#name : #K3LineNode,
	#superclass : #K3StartNode,
	#instVars : [
		'nlToken',
		'cmt',
		'stmts'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3LineNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLine: self
]

{ #category : #generated }
K3LineNode >> cmt [
	^ cmt
]

{ #category : #generated }
K3LineNode >> cmt: aSmaCCToken [
	cmt := aSmaCCToken
]

{ #category : #generated }
K3LineNode >> nlToken [
	^ nlToken
]

{ #category : #generated }
K3LineNode >> nlToken: aSmaCCToken [
	nlToken := aSmaCCToken
]

{ #category : #generated }
K3LineNode >> nodeVariables [
	^ #(#stmts)
]

{ #category : #generated }
K3LineNode >> stmts [
	^ stmts
]

{ #category : #generated }
K3LineNode >> stmts: aK3StmtsNode [
	self stmts notNil ifTrue: [ self stmts parent: nil ].
	stmts := aK3StmtsNode.
	self stmts notNil ifTrue: [ self stmts parent: self ]
]

{ #category : #generated }
K3LineNode >> tokenVariables [
	^ #(#nlToken #cmt)
]
