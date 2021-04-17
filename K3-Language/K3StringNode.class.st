Class {
	#name : #K3StringNode,
	#superclass : #K3StartNode,
	#instVars : [
		'strToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3StringNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitString: self
]

{ #category : #generated }
K3StringNode >> strToken [
	^ strToken
]

{ #category : #generated }
K3StringNode >> strToken: aSmaCCToken [
	strToken := aSmaCCToken
]

{ #category : #generated }
K3StringNode >> tokenVariables [
	^ #(#strToken)
]
