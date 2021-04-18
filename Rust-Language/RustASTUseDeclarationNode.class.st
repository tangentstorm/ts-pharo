Class {
	#name : #RustASTUseDeclarationNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'useToken',
		'timesTokens',
		'colonColonTokens',
		'idenTokens',
		'superTokens',
		'selfTokens',
		'crateTokens',
		'_crateTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'commaTokens',
		'asTokens',
		'_Tokens',
		'semicolonToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTUseDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> _crateTokens [
	^ _crateTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> _crateTokens: anOrderedCollection [
	_crateTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitUseDeclaration: self
]

{ #category : #generated }
RustASTUseDeclarationNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> colonColonTokens [
	^ colonColonTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> colonColonTokens: anOrderedCollection [
	colonColonTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> compositeTokenVariables [
	^ #(#timesTokens #colonColonTokens #idenTokens #superTokens #selfTokens #crateTokens #_crateTokens #leftBraceTokens #rightBraceTokens #commaTokens #asTokens #_Tokens)
]

{ #category : #generated }
RustASTUseDeclarationNode >> crateTokens [
	^ crateTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> crateTokens: anOrderedCollection [
	crateTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> idenTokens [
	^ idenTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> idenTokens: anOrderedCollection [
	idenTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
RustASTUseDeclarationNode >> initialize [
	super initialize.
	timesTokens := OrderedCollection new: 2.
	colonColonTokens := OrderedCollection new: 2.
	idenTokens := OrderedCollection new: 2.
	superTokens := OrderedCollection new: 2.
	selfTokens := OrderedCollection new: 2.
	crateTokens := OrderedCollection new: 2.
	_crateTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
]

{ #category : #generated }
RustASTUseDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
RustASTUseDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
RustASTUseDeclarationNode >> superTokens [
	^ superTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> superTokens: anOrderedCollection [
	superTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> timesTokens [
	^ timesTokens
]

{ #category : #generated }
RustASTUseDeclarationNode >> timesTokens: anOrderedCollection [
	timesTokens := anOrderedCollection
]

{ #category : #generated }
RustASTUseDeclarationNode >> tokenVariables [
	^ #(#useToken #semicolonToken #shebang)
]

{ #category : #generated }
RustASTUseDeclarationNode >> useToken [
	^ useToken
]

{ #category : #generated }
RustASTUseDeclarationNode >> useToken: aSmaCCToken [
	useToken := aSmaCCToken
]
