Class {
	#name : #ViewBexASTRefNode,
	#superclass : #ViewBexASTStartNode,
	#instVars : [
		'nid',
		'_Token',
		'inv'
	],
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexASTRefNode >> _Token [
	^ _Token
]

{ #category : #generated }
ViewBexASTRefNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRefNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitRef: self
]

{ #category : #generated }
ViewBexASTRefNode >> inv [
	^ inv
]

{ #category : #generated }
ViewBexASTRefNode >> inv: aSmaCCToken [
	inv := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRefNode >> nid [
	^ nid
]

{ #category : #generated }
ViewBexASTRefNode >> nid: aSmaCCToken [
	nid := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRefNode >> tokenVariables [
	^ #(#nid #_Token #inv #label #_LeftBracketToken #rightBracketToken)
]
