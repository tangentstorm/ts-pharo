Class {
	#name : #RustASTParenGroupNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'leftParenToken',
		'tree',
		'rightParenToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTParenGroupNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitParenGroup: self
]

{ #category : #generated }
RustASTParenGroupNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
RustASTParenGroupNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTParenGroupNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTParenGroupNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
RustASTParenGroupNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTParenGroupNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]

{ #category : #generated }
RustASTParenGroupNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTParenGroupNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
