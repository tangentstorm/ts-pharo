Class {
	#name : #RustASTVisItemNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'vis'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTVisItemNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitVisItem: self
]

{ #category : #generated }
RustASTVisItemNode >> otherVariables [
	^ #(#vis)
]

{ #category : #generated }
RustASTVisItemNode >> vis [
	^ vis
]

{ #category : #generated }
RustASTVisItemNode >> vis: anObject [
	self setParent: self vis to: nil.
	vis := anObject.
	self setParent: self vis to: self
]
