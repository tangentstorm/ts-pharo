"
With any luck, I describe a point.

(More or less copied from MADurationDescription, since that's also an object with a set of numbers.)


"
Class {
	#name : #GsPointDescription,
	#superclass : #MAElementDescription,
	#category : #'GameSketchLib-Magritte'
}

{ #category : #'accessing - defaults' }
GsPointDescription class >> defaultKind [
  ^ Point
]

{ #category : #testing }
GsPointDescription class >> isAbstract [
  ^ false
]

{ #category : #accessing }
GsPointDescription class >> label [
  ^ 'Point'
]

{ #category : #visiting }
GsPointDescription >> acceptMagritte: aVisitor [
	aVisitor visitPointDescription: self
]

{ #category : #accessing }
GsPointDescription >> read: aModel [
  |aPoint|
  aPoint := (super read: aModel) roundTo: 2.
  ^ aPoint
]

{ #category : #accessing }
GsPointDescription >> write: aString to: aModel [
  super write: (Point readFrom: aString) to: aModel
]
