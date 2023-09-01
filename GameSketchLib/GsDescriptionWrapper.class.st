"
I wrap magritte descriptions to provide some extra fields, like ""gsJsonId""
"
Class {
	#name : #GsDescriptionWrapper,
	#superclass : #Object,
	#instVars : [
		'description',
		'jsonKey',
		'visitor'
	],
	#classInstVars : [
		'jsonKey'
	],
	#category : #'GameSketchLib-Magritte'
}

{ #category : #accessing }
GsDescriptionWrapper >> acceptMagritte: aVisitor [
  visitor := aVisitor.
  description acceptMagritte: self
]

{ #category : #accessing }
GsDescriptionWrapper >> asGsDescription [
  ^ self
]

{ #category : #accessing }
GsDescriptionWrapper >> doesNotUnderstand: aMessage [
  "we have to proxy messages back and forth both to the visitor (so they visit the the wrapper when the underyling description sas to visit itself"
  (aMessage selector beginsWith: 'visit')
     ifTrue: [ aMessage argument: self; sendTo: visitor ] 
     ifFalse: [ ^ aMessage sendTo: description]
]

{ #category : #initialization }
GsDescriptionWrapper >> for: aDescription [
  description := aDescription.
]

{ #category : #accessing }
GsDescriptionWrapper >> jsonKey [
  ^ jsonKey ifNil: [ 
      description accessor readSelector asString]
]

{ #category : #'*GameSketchLib' }
GsDescriptionWrapper >> jsonKey: aString [
  jsonKey := aString
]
