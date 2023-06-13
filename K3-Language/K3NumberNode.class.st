Class {
	#name : #K3NumberNode,
	#superclass : #K3StartNode,
	#instVars : [
		'numberToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3NumberNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitNumber: self
]

{ #category : #generated }
K3NumberNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
K3NumberNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
K3NumberNode >> tokenVariables [
	^ #(#numberToken)
]
