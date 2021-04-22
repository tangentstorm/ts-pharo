Class {
	#name : #ViewBexASTStartNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'label',
		'_LeftBracketToken',
		'vids',
		'commaTokens',
		'rightBracketToken',
		'rows'
	],
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexASTStartNode >> _LeftBracketToken [
	^ _LeftBracketToken
]

{ #category : #generated }
ViewBexASTStartNode >> _LeftBracketToken: aSmaCCToken [
	_LeftBracketToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitStart: self
]

{ #category : #generated }
ViewBexASTStartNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
ViewBexASTStartNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
ViewBexASTStartNode >> compositeNodeVariables [
	^ #(#rows)
]

{ #category : #generated }
ViewBexASTStartNode >> compositeTokenVariables [
	^ #(#vids #commaTokens)
]

{ #category : #'generated-initialize-release' }
ViewBexASTStartNode >> initialize [
	super initialize.
	vids := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	rows := OrderedCollection new: 2.
]

{ #category : #generated }
ViewBexASTStartNode >> label [
	^ label
]

{ #category : #generated }
ViewBexASTStartNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
ViewBexASTStartNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> rows [
	^ rows
]

{ #category : #generated }
ViewBexASTStartNode >> rows: anOrderedCollection [
	self setParents: self rows to: nil.
	rows := anOrderedCollection.
	self setParents: self rows to: self
]

{ #category : #generated }
ViewBexASTStartNode >> tokenVariables [
	^ #(#label #_LeftBracketToken #rightBracketToken)
]

{ #category : #generated }
ViewBexASTStartNode >> vids [
	^ vids
]

{ #category : #generated }
ViewBexASTStartNode >> vids: anOrderedCollection [
	vids := anOrderedCollection
]
