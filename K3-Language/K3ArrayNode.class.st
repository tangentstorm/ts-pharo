Class {
	#name : #K3ArrayNode,
	#superclass : #K3StartNode,
	#instVars : [
		'items'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3ArrayNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitArray: self
]

{ #category : #'generated-initialize-release' }
K3ArrayNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
K3ArrayNode >> items [
	^ items
]

{ #category : #generated }
K3ArrayNode >> items: anOrderedCollection [
	self setParent: self items to: nil.
	items := anOrderedCollection.
	self setParent: self items to: self
]

{ #category : #generated }
K3ArrayNode >> otherVariables [
	^ #(#items)
]
