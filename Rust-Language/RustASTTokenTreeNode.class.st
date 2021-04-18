Class {
	#name : #RustASTTokenTreeNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'items'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTTokenTreeNode >> acceptVisitor: aTokenTreeVisitor [
	^ aTokenTreeVisitor visitTokenTree: self
]

{ #category : #generated }
RustASTTokenTreeNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
RustASTTokenTreeNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
RustASTTokenTreeNode >> items [
	^ items
]

{ #category : #generated }
RustASTTokenTreeNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]
