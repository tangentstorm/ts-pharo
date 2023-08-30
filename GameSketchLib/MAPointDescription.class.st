"
With any luck, I describe a point.

(More or less copied from MADurationDescription, since that's also an object with a set of numbers.)


"
Class {
	#name : #MAPointDescription,
	#superclass : #MAElementDescription,
	#category : #'GameSketchLib-Magritte'
}

{ #category : #'accessing - defaults' }
MAPointDescription class >> defaultKind [
  ^ Point
]

{ #category : #testing }
MAPointDescription class >> isAbstract [
  ^ false
]

{ #category : #accessing }
MAPointDescription class >> label [
  ^ 'Point'
]

{ #category : #visiting }
MAPointDescription >> acceptMagritte: aVisitor [
	aVisitor visitPointDescription: self
]
