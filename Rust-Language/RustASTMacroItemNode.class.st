Class {
	#name : #RustASTMacroItemNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'path',
		'bangBangToken',
		'leftParenToken',
		'tree',
		'rightParenToken',
		'semicolonToken',
		'leftBracketToken',
		'rightBracketToken',
		'leftBraceToken',
		'rightBraceToken',
		'macro_rulesToken',
		'bangToken',
		'idenToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTMacroItemNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitMacroItem: self
]

{ #category : #generated }
RustASTMacroItemNode >> bangBangToken [
	^ bangBangToken
]

{ #category : #generated }
RustASTMacroItemNode >> bangBangToken: aSmaCCToken [
	bangBangToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> bangToken [
	^ bangToken
]

{ #category : #generated }
RustASTMacroItemNode >> bangToken: aSmaCCToken [
	bangToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> idenToken [
	^ idenToken
]

{ #category : #generated }
RustASTMacroItemNode >> idenToken: aSmaCCToken [
	idenToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
RustASTMacroItemNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> macro_rulesToken [
	^ macro_rulesToken
]

{ #category : #generated }
RustASTMacroItemNode >> macro_rulesToken: aSmaCCToken [
	macro_rulesToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> nodeVariables [
	^ #(#tree)
]

{ #category : #generated }
RustASTMacroItemNode >> otherVariables [
	^ #(#path)
]

{ #category : #generated }
RustASTMacroItemNode >> path [
	^ path
]

{ #category : #generated }
RustASTMacroItemNode >> path: anOrderedCollection [
	self setParent: self path to: nil.
	path := anOrderedCollection.
	self setParent: self path to: self
]

{ #category : #generated }
RustASTMacroItemNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
RustASTMacroItemNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
RustASTMacroItemNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
RustASTMacroItemNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
RustASTMacroItemNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
RustASTMacroItemNode >> tokenVariables [
	^ #(#bangBangToken #leftParenToken #rightParenToken #semicolonToken #leftBracketToken #rightBracketToken #leftBraceToken #rightBraceToken #macro_rulesToken #bangToken #idenToken #shebang)
]

{ #category : #generated }
RustASTMacroItemNode >> tree [
	^ tree
]

{ #category : #generated }
RustASTMacroItemNode >> tree: aRustASTTokenTreeNode [
	self tree notNil
		ifTrue: [ self tree parent: nil ].
	tree := aRustASTTokenTreeNode.
	self tree notNil
		ifTrue: [ self tree parent: self ]
]
