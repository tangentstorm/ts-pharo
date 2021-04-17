Class {
	#name : #K3NumStrandNode,
	#superclass : #K3StartNode,
	#instVars : [
		'numTokens'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3NumStrandNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitNumStrand: self
]

{ #category : #generated }
K3NumStrandNode >> compositeTokenVariables [
	^ #(#numTokens)
]

{ #category : #'generated-initialize-release' }
K3NumStrandNode >> initialize [
	super initialize.
	numTokens := OrderedCollection new: 2.
]

{ #category : #generated }
K3NumStrandNode >> numTokens [
	^ numTokens
]

{ #category : #generated }
K3NumStrandNode >> numTokens: anOrderedCollection [
	numTokens := anOrderedCollection
]
