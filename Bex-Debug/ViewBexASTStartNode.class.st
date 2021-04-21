Class {
	#name : #ViewBexASTStartNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'label',
		'_Token',
		'dvars',
		'percentToken',
		'mvars',
		'rows'
	],
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexASTStartNode >> _Token [
	^ _Token
]

{ #category : #generated }
ViewBexASTStartNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> acceptVisitor: aStartVisitor [
	^ aStartVisitor visitStart: self
]

{ #category : #generated }
ViewBexASTStartNode >> compositeNodeVariables [
	^ #(#rows)
]

{ #category : #generated }
ViewBexASTStartNode >> dvars [
	^ dvars
]

{ #category : #generated }
ViewBexASTStartNode >> dvars: aViewBexASTVarsNode [
	self dvars notNil
		ifTrue: [ self dvars parent: nil ].
	dvars := aViewBexASTVarsNode.
	self dvars notNil
		ifTrue: [ self dvars parent: self ]
]

{ #category : #'generated-initialize-release' }
ViewBexASTStartNode >> initialize [
	super initialize.
	rows := OrderedCollection new: 2.
]

{ #category : #generated }
ViewBexASTStartNode >> label [
	^ label
]

{ #category : #generated }
ViewBexASTStartNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> mvars [
	^ mvars
]

{ #category : #generated }
ViewBexASTStartNode >> mvars: aViewBexASTVarsNode [
	self mvars notNil
		ifTrue: [ self mvars parent: nil ].
	mvars := aViewBexASTVarsNode.
	self mvars notNil
		ifTrue: [ self mvars parent: self ]
]

{ #category : #generated }
ViewBexASTStartNode >> nodeVariables [
	^ #(#dvars #mvars)
]

{ #category : #generated }
ViewBexASTStartNode >> percentToken [
	^ percentToken
]

{ #category : #generated }
ViewBexASTStartNode >> percentToken: aSmaCCToken [
	percentToken := aSmaCCToken
]

{ #category : #generated }
ViewBexASTStartNode >> rows [
	^ rows
]

{ #category : #generated }
ViewBexASTStartNode >> rows: anOrderedCollection [
	self setParents: self rows to: nil.
	rows := anOrderedCollection.
	self setParents: self rows to: self
]

{ #category : #generated }
ViewBexASTStartNode >> tokenVariables [
	^ #(#label #_Token #percentToken)
]
