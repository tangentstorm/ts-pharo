Class {
	#name : #ViewBexASTRowNode,
	#superclass : #ViewBexASTStartNode,
	#instVars : [
		'ix',
		'vid',
		'hi',
		'lo',
		'leftParenrcColonToken',
		'rc',
		'rightParenToken'
	],
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexASTRowNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitRow: self
]

{ #category : #generated }
ViewBexASTRowNode >> hi [
	^ hi
]

{ #category : #generated }
ViewBexASTRowNode >> hi: aViewBexASTRefNode [
	self hi notNil
		ifTrue: [ self hi parent: nil ].
	hi := aViewBexASTRefNode.
	self hi notNil
		ifTrue: [ self hi parent: self ]
]

{ #category : #generated }
ViewBexASTRowNode >> ix [
	^ ix
]

{ #category : #generated }
ViewBexASTRowNode >> ix: aSmaCCToken [
	ix := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRowNode >> leftParenrcColonToken [
	^ leftParenrcColonToken
]

{ #category : #generated }
ViewBexASTRowNode >> leftParenrcColonToken: aSmaCCToken [
	leftParenrcColonToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRowNode >> lo [
	^ lo
]

{ #category : #generated }
ViewBexASTRowNode >> lo: aViewBexASTRefNode [
	self lo notNil
		ifTrue: [ self lo parent: nil ].
	lo := aViewBexASTRefNode.
	self lo notNil
		ifTrue: [ self lo parent: self ]
]

{ #category : #generated }
ViewBexASTRowNode >> nodeVariables [
	^ #(#hi #lo #dvars #mvars)
]

{ #category : #generated }
ViewBexASTRowNode >> rc [
	^ rc
]

{ #category : #generated }
ViewBexASTRowNode >> rc: aSmaCCToken [
	rc := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRowNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ViewBexASTRowNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTRowNode >> tokenVariables [
	^ #(#ix #vid #leftParenrcColonToken #rc #rightParenToken #label #_Token #percentToken)
]

{ #category : #generated }
ViewBexASTRowNode >> vid [
	^ vid
]

{ #category : #generated }
ViewBexASTRowNode >> vid: aSmaCCToken [
	vid := aSmaCCToken
]
