Class {
	#name : #K3BlockNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3BlockNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitBlock: self
]
