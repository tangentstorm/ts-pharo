Class {
	#name : #RustASTCommentNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'token'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTCommentNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitComment: self
]

{ #category : #generated }
RustASTCommentNode >> token [
	^ token
]

{ #category : #generated }
RustASTCommentNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
RustASTCommentNode >> tokenVariables [
	^ #(#token)
]
