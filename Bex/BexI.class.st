Class {
	#name : #BexI,
	#superclass : #BexConst,
	#category : #Bex
}

{ #category : #accessing }
BexI >> color [
  ^ Color fromHexString: 'eeeeee' .
]

{ #category : #accessing }
BexI >> nodeString [
 ^ '1'
]

{ #category : #accessing }
BexI >> printString [
 ^ 'I'
]
