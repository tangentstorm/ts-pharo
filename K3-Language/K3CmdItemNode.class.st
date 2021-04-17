Class {
	#name : #K3CmdItemNode,
	#superclass : #K3StartNode,
	#instVars : [
		'cmdToken'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3CmdItemNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitCmdItem: self
]

{ #category : #generated }
K3CmdItemNode >> cmdToken [
	^ cmdToken
]

{ #category : #generated }
K3CmdItemNode >> cmdToken: aSmaCCToken [
	cmdToken := aSmaCCToken
]

{ #category : #generated }
K3CmdItemNode >> tokenVariables [
	^ #(#cmdToken)
]
