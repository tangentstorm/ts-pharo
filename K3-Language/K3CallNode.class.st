Class {
	#name : #K3CallNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3CallNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCall: self
]
