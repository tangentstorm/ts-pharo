Class {
	#name : #ViewBexASTVarsNode,
	#superclass : #ViewBexASTStartNode,
	#instVars : [
		'leftBracketToken',
		'vids',
		'commaTokens',
		'rightBracketToken'
	],
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexASTVarsNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitVars: self
]

{ #category : #generated }
ViewBexASTVarsNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
ViewBexASTVarsNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
ViewBexASTVarsNode >> compositeTokenVariables [
	^ #(#vids #commaTokens)
]

{ #category : #'generated-initialize-release' }
ViewBexASTVarsNode >> initialize [
	super initialize.
	vids := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ViewBexASTVarsNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
ViewBexASTVarsNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTVarsNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
ViewBexASTVarsNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTVarsNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken #label #_Token #percentToken)
]

{ #category : #generated }
ViewBexASTVarsNode >> vids [
	^ vids
]

{ #category : #generated }
ViewBexASTVarsNode >> vids: anOrderedCollection [
	vids := anOrderedCollection
]
