Class {
	#name : #RustASTTokenNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'commentToken',
		'stringToken',
		'charToken',
		'numberToken',
		'idenToken',
		'otherToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTTokenNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitToken: self
]

{ #category : #generated }
RustASTTokenNode >> charToken [
	^ charToken
]

{ #category : #generated }
RustASTTokenNode >> charToken: aSmaCCToken [
	charToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken [
	^ commentToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken: aSmaCCToken [
	commentToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken [
	^ idenToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken: aSmaCCToken [
	idenToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken [
	^ otherToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken: aSmaCCToken [
	otherToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> tokenVariables [
	^ #(#commentToken #stringToken #charToken #numberToken #idenToken #otherToken)
]
