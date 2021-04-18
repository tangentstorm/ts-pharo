Class {
	#name : #RustASTTokenTreeNode,
	#superclass : #RustASTSourceNode,
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTTokenTreeNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitTokenTree: self
]
