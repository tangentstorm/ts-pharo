Class {
	#name : #K3SymbolNode,
	#superclass : #K3StartNode,
	#instVars : [
		'symbolToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3SymbolNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitSymbol: self
]

{ #category : #generated }
K3SymbolNode >> symbolToken [
	^ symbolToken
]

{ #category : #generated }
K3SymbolNode >> symbolToken: aSmaCCToken [
	symbolToken := aSmaCCToken
]

{ #category : #generated }
K3SymbolNode >> tokenVariables [
	^ #(#symbolToken)
]
