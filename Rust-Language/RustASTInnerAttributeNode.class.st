Class {
	#name : #RustASTInnerAttributeNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'_BangBangLeftBracketToken',
		'tree',
		'rightBracketToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTInnerAttributeNode >> _BangBangLeftBracketToken [
	^ _BangBangLeftBracketToken
]

{ #category : #generated }
RustASTInnerAttributeNode >> _BangBangLeftBracketToken: aSmaCCToken [
	_BangBangLeftBracketToken := aSmaCCToken
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
	^ #(#_BangBangLeftBracketToken #rightBracketToken #shebang)
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
