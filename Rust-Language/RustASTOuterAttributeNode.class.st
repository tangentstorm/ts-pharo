Class {
	#name : #RustASTOuterAttributeNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'_LeftBracketToken',
		'tree',
		'rightBracketToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTOuterAttributeNode >> _LeftBracketToken [
	^ _LeftBracketToken
]

{ #category : #generated }
RustASTOuterAttributeNode >> _LeftBracketToken: aSmaCCToken [
	_LeftBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTOuterAttributeNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitOuterAttribute: self
]

{ #category : #generated }
RustASTOuterAttributeNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTOuterAttributeNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
RustASTOuterAttributeNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTOuterAttributeNode >> tokenVariables [
	^ #(#_LeftBracketToken #rightBracketToken #shebang)
]

{ #category : #generated }
RustASTOuterAttributeNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTOuterAttributeNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
