Class {
	#name : #K3IfStmtNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3IfStmtNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitIfStmt: self
]
