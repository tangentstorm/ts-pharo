Class {
	#name : #RustASTItemNode,
	#superclass : #RustASTSourceNode,
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTItemNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitItem: self
]
