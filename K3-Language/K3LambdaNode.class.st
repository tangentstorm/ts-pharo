Class {
	#name : #K3LambdaNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3LambdaNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitLambda: self
]
