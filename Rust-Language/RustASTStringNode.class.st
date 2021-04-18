Class {
	#name : #RustASTStringNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'token'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTStringNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitString: self
]

{ #category : #generated }
RustASTStringNode >> token [
	^ token
]

{ #category : #generated }
RustASTStringNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
RustASTStringNode >> tokenVariables [
	^ #(#token)
]
