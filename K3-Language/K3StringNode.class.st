Class {
	#name : #K3StringNode,
	#superclass : #K3StartNode,
	#instVars : [
		'stringToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3StringNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitString: self
]

{ #category : #generated }
K3StringNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
K3StringNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
K3StringNode >> tokenVariables [
	^ #(#stringToken)
]
