Class {
	#name : #K3AssignNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3AssignNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitAssign: self
]
