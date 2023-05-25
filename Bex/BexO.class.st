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
BexO >> nodeString [
 ^ '0'
]

{ #category : #accessing }
BexO >> nodeText [
  |t|
  t := Text fromString: self nodeString .
  t addAttribute: TextColor white.
  ^ t asRopedText
]

{ #category : #accessing }
BexO >> printString [
 ^ 'O'
]
