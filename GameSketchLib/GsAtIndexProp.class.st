"
I am a virtual property that lets you set and get the value of an item in a collection.

{{gtClass:GsPathShape}} uses me for its handles, for example.

"
Class {
	#name : #GsAtIndexProp,
	#superclass : #GsProp,
	#instVars : [
		'index'
	],
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsAtIndexProp >> index: anIndex [
  index := anIndex
]

{ #category : #accessing }
GsAtIndexProp >> read: anObject [
  ^ anObject at: index
]

{ #category : #accessing }
GsAtIndexProp >> write: aValue to: anObject [
  anObject at: index put: aValue.
  ^ aValue
]
