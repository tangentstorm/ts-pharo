Class {
	#name : #RustASTSourceNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'attrs',
		'items',
		'shebang'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTSourceNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitSource: self
]

{ #category : #generated }
RustASTSourceNode >> attrs [
	^ attrs
]

{ #category : #generated }
RustASTSourceNode >> attrs: anOrderedCollection [
	self setParents: self attrs to: nil.
	attrs := anOrderedCollection.
	self setParents: self attrs to: self
]

{ #category : #generated }
RustASTSourceNode >> compositeNodeVariables [
	^ #(#attrs #items)
]

{ #category : #'generated-initialize-release' }
RustASTSourceNode >> initialize [
	super initialize.
	attrs := OrderedCollection new: 2.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
RustASTSourceNode >> items [
	^ items
]

{ #category : #generated }
RustASTSourceNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
RustASTSourceNode >> shebang [
	^ shebang
]

{ #category : #generated }
RustASTSourceNode >> shebang: aSmaCCToken [
	shebang := aSmaCCToken
]

{ #category : #generated }
RustASTSourceNode >> tokenVariables [
	^ #(#shebang)
]
