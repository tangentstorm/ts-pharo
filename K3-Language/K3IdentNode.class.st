Class {
	#name : #K3IdentNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3IdentNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitIdent: self
]
