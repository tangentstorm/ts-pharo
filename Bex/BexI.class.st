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
 ^ '⊤'
]

{ #category : #accessing }
BexI >> nodeText [
  ^ super nodeText fontName: 'Cambria Math'
]

{ #category : #accessing }
BexI >> printString [
 ^ 'I'
]
