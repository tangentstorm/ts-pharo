Class {
	#name : #K3ArrayNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3ArrayNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitArray: self
]
