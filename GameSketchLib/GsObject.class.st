Class {
	#name : #GsObject,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'active'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsObject >> childAtPoint: p [
  ^ self childAtPoint: p ifNone: [nil]
]

{ #category : #accessing }
GsObject >> childAtPoint: p ifNone: aBlock [
  ^ children
      detect: [:x|x bounds asRectangle containsPoint: p]
      ifNone: aBlock
]

{ #category : #accessing }
GsObject >> initialize [
  super initialize.
  active := false
]

{ #category : #initialization }
GsObject >> matchParentBounds [
  self matchParent
]
