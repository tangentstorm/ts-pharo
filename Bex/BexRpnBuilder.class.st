Class {
	#name : #BexRpnBuilder,
	#superclass : #Object,
	#instVars : [
		'stack',
		'nodes'
	],
	#category : #'Bex-RPN'
}

{ #category : #accessing }
BexRpnBuilder >> initialize [
  super initialize.
  stack := Stack new.
  nodes := OrderedCollection new.
]

{ #category : #accessing }
BexRpnBuilder >> push: aSymbol [
  stack push: (BexShape new symbol: aSymbol)
]

{ #category : #accessing }
BexRpnBuilder >> tos [
  ^ stack top
]

{ #category : #accessing }
BexRpnBuilder >> x0 [
  self push: #x0
]

{ #category : #accessing }
BexRpnBuilder >> x1 [
  self push: #x1
]

{ #category : #accessing }
BexRpnBuilder >> x2 [
  self push: #x2
]

{ #category : #accessing }
BexRpnBuilder >> x3 [
  self push: #x3
]

{ #category : #accessing }
BexRpnBuilder >> x4 [
  self push: #x4
]
