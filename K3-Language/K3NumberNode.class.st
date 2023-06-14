Class {
	#name : #K3NumberNode,
	#superclass : #K3StartNode,
	#instVars : [
		'number'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3NumberNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitNumber: self
]

{ #category : #generated }
K3NumberNode >> number [
	^ number
]

{ #category : #generated }
K3NumberNode >> number: aSmaCCToken [
	number := aSmaCCToken
]

{ #category : #generated }
K3NumberNode >> tokenVariables [
	^ #(#number)
]
