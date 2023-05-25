Class {
	#name : #BexConst,
	#superclass : #Bex,
	#classInstVars : [
		'instance'
	],
	#category : #Bex
}

{ #category : #accessing }
BexConst class >> isAbstract [
  ^ self == BexConst
]

{ #category : #accessing }
BexConst class >> new [
  instance ifNil: [instance := super new].
  ^ instance.
]
