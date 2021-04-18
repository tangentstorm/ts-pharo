Class {
	#name : #RustASTBrackGroupNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'leftBracketToken',
		'tree',
		'rightBracketToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTBrackGroupNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitBrackGroup: self
]

{ #category : #generated }
RustASTBrackGroupNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
RustASTBrackGroupNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTBrackGroupNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTBrackGroupNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
RustASTBrackGroupNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTBrackGroupNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken)
]

{ #category : #generated }
RustASTBrackGroupNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTBrackGroupNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
