Class {
	#name : #RustASTInnerAttributeNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'_BangLeftBracketToken',
		'tree',
		'rightBracketToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTInnerAttributeNode >> _BangLeftBracketToken [
	^ _BangLeftBracketToken
]

{ #category : #generated }
RustASTInnerAttributeNode >> _BangLeftBracketToken: aSmaCCToken [
	_BangLeftBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTInnerAttributeNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitInnerAttribute: self
]

{ #category : #generated }
RustASTInnerAttributeNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTInnerAttributeNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
RustASTInnerAttributeNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTInnerAttributeNode >> tokenVariables [
	^ #(#_BangLeftBracketToken #rightBracketToken #shebang)
]

{ #category : #generated }
RustASTInnerAttributeNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTInnerAttributeNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
