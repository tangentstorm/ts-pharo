Class {
	#name : #GsSetter,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #'GameSketchLib-Setters'
}

{ #category : #accessing }
GsSetter class >> for: anObject [
  ^ self new target: anObject
]

{ #category : #accessing }
GsSetter class >> for: aSlotName on: anObject [
  ^ (GsSetterKinds setterFor: aSlotName) new target: anObject
]

{ #category : #accessing }
GsSetter >> printOn: aStream [
  super printOn: aStream.
  aStream nextPutAll: '(for: '.
  target id printOn: aStream.
  aStream nextPut: $).
]

{ #category : #accessing }
GsSetter >> target [
	^ target
]

{ #category : #accessing }
GsSetter >> target: anObject [
	target := anObject
]
