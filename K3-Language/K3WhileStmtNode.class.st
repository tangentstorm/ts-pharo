Class {
	#name : #K3WhileStmtNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3WhileStmtNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitWhileStmt: self
]
