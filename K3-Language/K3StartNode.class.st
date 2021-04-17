Class {
	#name : #K3StartNode,
	#superclass : #SmaCCParseNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3StartNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitStart: self
]
