Class {
	#name : #K3AdverbNode,
	#superclass : #K3StartNode,
	#instVars : [
		'adverbToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3AdverbNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitAdverb: self
]

{ #category : #generated }
K3AdverbNode >> adverbToken [
	^ adverbToken
]

{ #category : #generated }
K3AdverbNode >> adverbToken: aSmaCCToken [
	adverbToken := aSmaCCToken
]

{ #category : #generated }
K3AdverbNode >> tokenVariables [
	^ #(#adverbToken)
]
