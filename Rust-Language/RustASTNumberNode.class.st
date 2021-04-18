Class {
	#name : #RustASTNumberNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'token'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTNumberNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitNumber: self
]

{ #category : #generated }
RustASTNumberNode >> token [
	^ token
]

{ #category : #generated }
RustASTNumberNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
RustASTNumberNode >> tokenVariables [
	^ #(#token)
]
