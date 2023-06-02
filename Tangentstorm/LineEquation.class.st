Class {
	#name : #LineEquation,
	#superclass : #Object,
	#instVars : [
		'm',
		'b'
	],
	#category : #Tangentstorm
}

{ #category : #accessing }
LineEquation >> * k [
  (k isKindOf: LineEquation)
    ifTrue:  [ self halt. ^ self * k m + k b ]
    ifFalse: [ m := m * k. b := b * k. ^ self ]
]

{ #category : #accessing }
LineEquation >> + k [
  (k isKindOf: LineEquation)
    ifTrue:  [ self halt. ^ (self m + k m) x + (self b + k b)]
    ifFalse: [ b := b + k. ^ self ]
]

{ #category : #accessing }
LineEquation >> at: x [
  "Evaluate the expression at the given x value."
  ^ (m * x) + b
]

{ #category : #accessing }
LineEquation >> b [
  ^ b
]

{ #category : #accessing }
LineEquation >> initialize [
  m := 1.
  b := 0.
]

{ #category : #accessing }
LineEquation >> label [
  ^ 'an equation'
]

{ #category : #accessing }
LineEquation >> m [
  ^ m
]

{ #category : #accessing }
LineEquation >> m: mVal [
  m := mVal.
  ^ self
  
]

{ #category : #accessing }
LineEquation >> printOn: aStream [
  aStream
    nextPutAll: ((m = 1)
      ifTrue: ['x']
      ifFalse: [m asString, ' x']);
    nextPutAll: ((b = 0)
      ifTrue: ['']
      ifFalse: [' + ', b asString]).
]
