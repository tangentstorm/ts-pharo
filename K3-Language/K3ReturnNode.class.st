Class {
	#name : #K3ReturnNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3ReturnNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitReturn: self
]
