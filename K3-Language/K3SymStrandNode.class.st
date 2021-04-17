Class {
	#name : #K3SymStrandNode,
	#superclass : #K3StartNode,
	#instVars : [
		'symTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3SymStrandNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitSymStrand: self
]

{ #category : #generated }
K3SymStrandNode >> compositeTokenVariables [
	^ #(#symTokens)
]

{ #category : #'generated-initialize-release' }
K3SymStrandNode >> initialize [
	super initialize.
	symTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3SymStrandNode >> symTokens [
	^ symTokens
]

{ #category : #generated }
K3SymStrandNode >> symTokens: anOrderedCollection [
	symTokens := anOrderedCollection
]
