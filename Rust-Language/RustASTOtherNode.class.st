Class {
	#name : #RustASTOtherNode,
	#superclass : #RustASTTokenTreeNode,
	#instVars : [
		'token'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTOtherNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitOther: self
]

{ #category : #generated }
RustASTOtherNode >> token [
	^ token
]

{ #category : #generated }
RustASTOtherNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
RustASTOtherNode >> tokenVariables [
	^ #(#token)
]
