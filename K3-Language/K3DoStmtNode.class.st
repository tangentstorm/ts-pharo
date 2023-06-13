Class {
	#name : #K3DoStmtNode,
	#superclass : #K3StartNode,
	#category : #'K3-Language'
}

{ #category : #generated }
K3DoStmtNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitDoStmt: self
]
