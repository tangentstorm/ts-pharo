Class {
	#name : #K3LineNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3LineNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLine: self
]
