Class {
	#name : #K3CondNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3CondNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCond: self
]
