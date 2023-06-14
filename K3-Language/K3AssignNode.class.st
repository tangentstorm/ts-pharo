Class {
	#name : #K3AssignNode,
	#superclass : #K3StartNode,
	#instVars : [
		'lv',
		'op',
		'expr'
	],
	#category : #'K3-Language'
}

{ #category : #generated }
K3AssignNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitAssign: self
]

{ #category : #generated }
K3AssignNode >> expr [
	^ expr
]

{ #category : #generated }
K3AssignNode >> expr: aK3ChainNode [
	self expr notNil ifTrue: [ self expr parent: nil ].
	expr := aK3ChainNode.
	self expr notNil ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
K3AssignNode >> lv [
	^ lv
]

{ #category : #generated }
K3AssignNode >> lv: aK3LValueNode [
	self lv notNil ifTrue: [ self lv parent: nil ].
	lv := aK3LValueNode.
	self lv notNil ifTrue: [ self lv parent: self ]
]

{ #category : #generated }
K3AssignNode >> nodeVariables [
	^ #(#lv #expr)
]

{ #category : #generated }
K3AssignNode >> op [
	^ op
]

{ #category : #generated }
K3AssignNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
K3AssignNode >> tokenVariables [
	^ #(#op)
]
