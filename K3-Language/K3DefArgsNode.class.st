Class {
	#name : #K3DefArgsNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3DefArgsNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitDefArgs: self
]
