"
I am the  base class for visual objects in {{gtPackage:GameSketchLib}}.

I add the {{gtClass:TBrLayoutResizable}} to {{gtClass:BlElement}}, and also provide methods for finding child objects at a given point.

"
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

{ #category : #initialization }
GsObject >> initialize [
  super initialize.
  active := false
]
