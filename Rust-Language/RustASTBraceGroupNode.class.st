Class {
	#name : #RustASTBraceGroupNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'leftBraceToken',
		'tree',
		'rightBraceToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTBraceGroupNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitBraceGroup: self
]

{ #category : #generated }
RustASTBraceGroupNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
RustASTBraceGroupNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTBraceGroupNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTBraceGroupNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
RustASTBraceGroupNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTBraceGroupNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken #shebang)
]

{ #category : #generated }
RustASTBraceGroupNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTBraceGroupNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
