Class {
	#name : #RustASTTokenNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'commentToken',
		'stringToken',
		'charToken',
		'numberToken',
		'idenToken',
		'otherToken',
		'colonColonToken',
		'selfToken',
		'pubToken',
		'useToken',
		'externToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTTokenNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitToken: self
]

{ #category : #generated }
RustASTTokenNode >> charToken [
	^ charToken
]

{ #category : #generated }
RustASTTokenNode >> charToken: aSmaCCToken [
	charToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
RustASTTokenNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken [
	^ commentToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken: aSmaCCToken [
	commentToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> externToken [
	^ externToken
]

{ #category : #generated }
RustASTTokenNode >> externToken: aSmaCCToken [
	externToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken [
	^ idenToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken: aSmaCCToken [
	idenToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken [
	^ otherToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken: aSmaCCToken [
	otherToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> pubToken [
	^ pubToken
]

{ #category : #generated }
RustASTTokenNode >> pubToken: aSmaCCToken [
	pubToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> selfToken [
	^ selfToken
]

{ #category : #generated }
RustASTTokenNode >> selfToken: aSmaCCToken [
	selfToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> tokenVariables [
	^ #(#commentToken #stringToken #charToken #numberToken #idenToken #otherToken #colonColonToken #selfToken #pubToken #useToken #externToken #shebang)
]

{ #category : #generated }
RustASTTokenNode >> useToken [
	^ useToken
]

{ #category : #generated }
RustASTTokenNode >> useToken: aSmaCCToken [
	useToken := aSmaCCToken
]
