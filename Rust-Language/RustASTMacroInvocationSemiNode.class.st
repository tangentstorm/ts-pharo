Class {
	#name : #RustASTMacroInvocationSemiNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'path',
		'bangToken',
		'leftParenToken',
		'tree',
		'rightParenToken',
		'semicolonToken',
		'leftBracketToken',
		'rightBracketToken',
		'leftBraceToken',
		'rightBraceToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTMacroInvocationSemiNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitMacroInvocationSemi: self
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> bangToken [
	^ bangToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> bangToken: aSmaCCToken [
	bangToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> otherVariables [
	^ #(#path #items)
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> path [
	^ path
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> path: anOrderedCollection [
	self setParent: self path to: nil.
	path := anOrderedCollection.
	self setParent: self path to: self
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> tokenVariables [
	^ #(#bangToken #leftParenToken #rightParenToken #semicolonToken #leftBracketToken #rightBracketToken #leftBraceToken #rightBraceToken #shebang)
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTMacroInvocationSemiNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
