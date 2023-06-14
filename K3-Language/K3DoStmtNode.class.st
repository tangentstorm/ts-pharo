Class {
	#name : #K3DoStmtNode,
	#superclass : #K3StartNode,
	#instVars : [
		'doLeftBracketToken',
		'block',
		'rightBracketToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3DoStmtNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitDoStmt: self
]

{ #category : #generated }
K3DoStmtNode >> block [
	^ block
]

{ #category : #generated }
K3DoStmtNode >> block: aK3BlockNode [
	self block notNil ifTrue: [ self block parent: nil ].
	block := aK3BlockNode.
	self block notNil ifTrue: [ self block parent: self ]
]

{ #category : #generated }
K3DoStmtNode >> doLeftBracketToken [
	^ doLeftBracketToken
]

{ #category : #generated }
K3DoStmtNode >> doLeftBracketToken: aSmaCCToken [
	doLeftBracketToken := aSmaCCToken
]

{ #category : #generated }
K3DoStmtNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
K3DoStmtNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
K3DoStmtNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
K3DoStmtNode >> tokenVariables [
	^ #(#doLeftBracketToken #rightBracketToken)
]
