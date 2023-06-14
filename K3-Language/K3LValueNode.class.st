Class {
	#name : #K3LValueNode,
	#superclass : #K3StartNode,
	#instVars : [
		'ident',
		'calls'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3LValueNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLValue: self
]

{ #category : #generated }
K3LValueNode >> calls [
	^ calls
]

{ #category : #generated }
K3LValueNode >> calls: anOrderedCollection [
	self setParents: self calls to: nil.
	calls := anOrderedCollection.
	self setParents: self calls to: self
]

{ #category : #generated }
K3LValueNode >> compositeNodeVariables [
	^ #(#calls)
]

{ #category : #generated }
K3LValueNode >> ident [
	^ ident
]

{ #category : #generated }
K3LValueNode >> ident: aSmaCCToken [
	ident := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
K3LValueNode >> initialize [
	super initialize.
	calls := OrderedCollection new: 2.
]

{ #category : #generated }
K3LValueNode >> tokenVariables [
	^ #(#ident)
]
