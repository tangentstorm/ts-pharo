Class {
	#name : #K3ListNode,
	#superclass : #K3StartNode,
	#instVars : [
		'leftParenToken',
		'block',
		'rightParenToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3ListNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitList: self
]

{ #category : #generated }
K3ListNode >> block [
	^ block
]

{ #category : #generated }
K3ListNode >> block: aK3BlockNode [
	self block notNil ifTrue: [ self block parent: nil ].
	block := aK3BlockNode.
	self block notNil ifTrue: [ self block parent: self ]
]

{ #category : #generated }
K3ListNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
K3ListNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
K3ListNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
K3ListNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
K3ListNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
K3ListNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
