Class {
	#name : #K3ListNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3ListNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitList: self
]
