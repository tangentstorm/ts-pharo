Class {
	#name : #K3NumArrayNode,
	#superclass : #K3StartNode,
	#instVars : [
		'nums'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3NumArrayNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitNumArray: self
]

{ #category : #generated }
K3NumArrayNode >> compositeNodeVariables [
	^ #(#nums)
]

{ #category : #'generated-initialize-release' }
K3NumArrayNode >> initialize [
	super initialize.
	nums := OrderedCollection new: 2.
]

{ #category : #generated }
K3NumArrayNode >> nums [
	^ nums
]

{ #category : #generated }
K3NumArrayNode >> nums: anOrderedCollection [
	self setParents: self nums to: nil.
	nums := anOrderedCollection.
	self setParents: self nums to: self
]
