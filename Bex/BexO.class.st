Class {
	#name : #BexO,
	#superclass : #BexConst,
	#category : #Bex
}

{ #category : #accessing }
BexO >> color [
  ^ Color fromHexString: '333333'.
]

{ #category : #accessing }
BexO >> printString [
 ^ 'O'
]
