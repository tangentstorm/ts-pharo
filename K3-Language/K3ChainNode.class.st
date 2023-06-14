Class {
	#name : #K3ChainNode,
	#superclass : #K3StartNode,
	#instVars : [
		'items'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3ChainNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitChain: self
]

{ #category : #generated }
K3ChainNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
K3ChainNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
K3ChainNode >> items [
	^ items
]

{ #category : #generated }
K3ChainNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]
