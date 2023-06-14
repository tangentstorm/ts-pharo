Class {
	#name : #K3IdentNode,
	#superclass : #K3StartNode,
	#instVars : [
		'gnameToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3IdentNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitIdent: self
]

{ #category : #generated }
K3IdentNode >> gnameToken [
	^ gnameToken
]

{ #category : #generated }
K3IdentNode >> gnameToken: aSmaCCToken [
	gnameToken := aSmaCCToken
]

{ #category : #generated }
K3IdentNode >> tokenVariables [
	^ #(#gnameToken)
]
