Class {
	#name : #K3PrimNode,
	#superclass : #K3StartNode,
	#instVars : [
		'primToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3PrimNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitPrim: self
]

{ #category : #generated }
K3PrimNode >> primToken [
	^ primToken
]

{ #category : #generated }
K3PrimNode >> primToken: aSmaCCToken [
	primToken := aSmaCCToken
]

{ #category : #generated }
K3PrimNode >> tokenVariables [
	^ #(#primToken)
]
