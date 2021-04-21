Class {
	#name : #ViewBexASTRefNode,
	#superclass : #ViewBexASTStartNode,
	#instVars : [
		'nid',
		'inv'
	],
	#category : #'Bex-Debug'
}

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
	^ #(#nid #inv #label #_Token #percentToken)
]
