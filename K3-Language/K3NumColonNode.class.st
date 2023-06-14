Class {
	#name : #K3NumColonNode,
	#superclass : #K3StartNode,
	#instVars : [
		'numcolonToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3NumColonNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitNumColon: self
]

{ #category : #generated }
K3NumColonNode >> numcolonToken [
	^ numcolonToken
]

{ #category : #generated }
K3NumColonNode >> numcolonToken: aSmaCCToken [
	numcolonToken := aSmaCCToken
]

{ #category : #generated }
K3NumColonNode >> tokenVariables [
	^ #(#numcolonToken)
]
