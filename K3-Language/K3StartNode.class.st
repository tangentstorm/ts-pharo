Class {
	#name : #K3StartNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'symbols'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3StartNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitStart: self
]

{ #category : #generated }
K3StartNode >> compositeTokenVariables [
	^ #(#symbols)
]

{ #category : #'generated-initialize-release' }
K3StartNode >> initialize [
	super initialize.
	symbols := OrderedCollection new: 2.
]

{ #category : #generated }
K3StartNode >> symbols [
	^ symbols
]

{ #category : #generated }
K3StartNode >> symbols: anOrderedCollection [
	symbols := anOrderedCollection
]
