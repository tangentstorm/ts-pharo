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
  ^ (super read: aModel) roundTo: 0.001.
]

{ #category : #accessing }
GsPointDescription >> write: anObject to: aModel [
  "Inspector forms and json give us a string, but GsHandle gives me an actual point."
  (anObject isKindOf: Point)
    ifTrue: [ super write: anObject to: aModel]
    ifFalse: [
  super write: (Point readFrom: anObject) to: aModel]
]
