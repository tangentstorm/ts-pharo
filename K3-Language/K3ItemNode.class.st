Class {
	#name : #K3ItemNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3ItemNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitItem: self
]
