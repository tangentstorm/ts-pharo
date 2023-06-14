Class {
	#name : #K3LValueNode,
	#superclass : #K3StartNode,
	#instVars : [
		'lv'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3LValueNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLValue: self
]

{ #category : #generated }
K3LValueNode >> lv [
	^ lv
]

{ #category : #generated }
K3LValueNode >> lv: aSmaCCToken [
	lv := aSmaCCToken
]

{ #category : #generated }
K3LValueNode >> tokenVariables [
	^ #(#lv)
]
