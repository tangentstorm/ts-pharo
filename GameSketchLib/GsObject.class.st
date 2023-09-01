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
	#category : #'GameSketchLib-Core'
}

{ #category : #magritte }
GsObject >> backgroundDescription [
  <magritteDescription>
  ^ MAElementDescription new
    accessor: #background;
    label: 'Background';
    kind: BlBackground;
    yourself
]

{ #category : #accessing }
GsObject >> childAtPoint: p [
  ^ self childAtPoint: p ifNone: [nil]
]

{ #category : #accessing }
GsObject >> childAtPoint: p ifNone: aBlock [
  ^ children reversed
      detect: [:x|x gsContainsPoint: p]
      ifNone: aBlock
]

{ #category : #accessing }
GsObject >> childAtPoint: p where: aConditionBlock ifNone: aBlock [
  ^ children reversed
      detect: [:x| (x gsContainsPoint: p) and: [aConditionBlock value: x]]
      ifNone: aBlock
]

{ #category : #initialization }
GsObject >> initialize [
  super initialize.
  active := false
]
