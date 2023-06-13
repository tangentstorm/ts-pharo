Class {
	#name : #K3SigNode,
	#superclass : #K3StartNode,
	#instVars : [
		'leftBracketToken',
		'semicolonTokens',
		'lnameTokens',
		'rightBracketToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3SigNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitSig: self
]

{ #category : #generated }
K3SigNode >> compositeTokenVariables [
	^ #(#semicolonTokens #lnameTokens)
]

{ #category : #'generated-initialize-release' }
K3SigNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	lnameTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3SigNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
K3SigNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
K3SigNode >> lnameTokens [
	^ lnameTokens
]

{ #category : #generated }
K3SigNode >> lnameTokens: anOrderedCollection [
	lnameTokens := anOrderedCollection
]

{ #category : #generated }
K3SigNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
K3SigNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
K3SigNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
K3SigNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
K3SigNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken)
]
