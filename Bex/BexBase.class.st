Class {
	#name : #BexBase,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'nids',
		'idCounter'
	],
	#category : #'Bex-Base'
}

{ #category : #accessing }
BexBase >> initialize [
  super initialize.
  idCounter := 0.
  nodes := Dictionary new.
  nids := WeakIdentityKeyDictionary new.
]

{ #category : #accessing }
BexBase >> op: anOp x: xNode y: yNode [
]
