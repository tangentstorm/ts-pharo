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
