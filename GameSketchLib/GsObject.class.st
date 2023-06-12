Class {
	#name : #GsObject,
	#superclass : #BlElement,
	#instVars : [
		'active'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsObject >> initialize [
  super initialize.
  active := false
]

{ #category : #initialization }
GsObject >> matchParentBounds [
  self constraintsDo: [:c| 
    c horizontal matchParent.
	c vertical matchParent]
]
