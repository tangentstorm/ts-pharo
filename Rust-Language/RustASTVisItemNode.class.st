Class {
	#name : #RustASTVisItemNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'externToken',
		'crateToken',
		'idenTokens',
		'selfToken',
		'semicolonToken',
		'asToken',
		'_Token',
		'vis'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTVisItemNode >> _Token [
	^ _Token
]

{ #category : #generated }
RustASTVisItemNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitVisItem: self
]

{ #category : #generated }
RustASTVisItemNode >> asToken [
	^ asToken
]

{ #category : #generated }
RustASTVisItemNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> compositeTokenVariables [
	^ #(#idenTokens)
]

{ #category : #generated }
RustASTVisItemNode >> crateToken [
	^ crateToken
]

{ #category : #generated }
RustASTVisItemNode >> crateToken: aSmaCCToken [
	crateToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> externToken [
	^ externToken
]

{ #category : #generated }
RustASTVisItemNode >> externToken: aSmaCCToken [
	externToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> idenTokens [
	^ idenTokens
]

{ #category : #generated }
RustASTVisItemNode >> idenTokens: anOrderedCollection [
	idenTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
RustASTVisItemNode >> initialize [
	super initialize.
	idenTokens := OrderedCollection new: 2.
]

{ #category : #generated }
RustASTVisItemNode >> otherVariables [
	^ #(#vis)
]

{ #category : #generated }
RustASTVisItemNode >> selfToken [
	^ selfToken
]

{ #category : #generated }
RustASTVisItemNode >> selfToken: aSmaCCToken [
	selfToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
RustASTVisItemNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> tokenVariables [
	^ #(#externToken #crateToken #selfToken #semicolonToken #asToken #_Token #shebang)
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
