"
I act like a setter for properties on objects in the scene.

I am probably a bad idea, but basically I make {{gtClass:BlElement}} look like it has nice symmetrical getter/setter pairs.

For example, instead of `position`/`position:`, it has `position`/`relocate:`, and also there is also no simple `rotation` accessor.

Probably I will be replaced by simple symmetric setters in {{gtClass:GsObject}}that delegate to the corresponding {{gtClass:BlElement}} properties.


"
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
