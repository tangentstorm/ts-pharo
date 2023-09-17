Class {
	#name : #GsMagritteExamples,
	#superclass : #Object,
	#instVars : [
		'point'
	],
	#category : #'GameSketchLib-Magritte'
}

{ #category : #accessing }
GsMagritteExamples class >> circleShape [
  <gtExample>
  |c|
  c := GsCircleShape new id: #shape001.
  self assert: (STONJSON fromString: (c gsJson))
     equals: (STONJSON fromString: '{"class":"GsCircleShape", "id":"shape001", "strokeColor":"#000000", "fill":"#FFFFFF", "center":"(0.0@0.0)", "radius":10}').
  ^ c
]

{ #category : #accessing }
GsMagritteExamples class >> pointDescriptionExample [
  |this|
  this := self new point: 12.1111111@34.
  self
    assert: (this pointDescription read: this)
    equals: '12.11@34'
]

{ #category : #accessing }
GsMagritteExamples class >> sceneWithCircle [
  <gtExample>
  |c s data|
  s := GsScene new addChild: self circleShape. 
  data := (STONJSON fromString: s gsJson).
  self assert: (data at: #class) equals: 'GsScene'.
  self assert: (data at: #fill) equals: '#9F9F9F'.
  c := (data at: #children) first.
  self assert: (c at: #class) equals: 'GsCircleShape'.
  self assert: (c at: #id) equals: 'shape001'.
  self assert: (c at: #fill) equals: '#FFFFFF'.
  self assert: (c at: #center) equals: '(0.0@0.0)'.
  self assert: (c at: #radius) equals: 10.
  ^ s
  
]

{ #category : #accessing }
GsMagritteExamples >> gsIdDescription [
  <gtExample>
  |d|
  d := GsObject new gsIdDescription.
  self assert: d jsonKey equals: 'id'.
  ^ d 
]

{ #category : #accessing }
GsMagritteExamples >> point [
	^ point
]

{ #category : #accessing }
GsMagritteExamples >> point: anObject [
	point := anObject
]

{ #category : #accessing }
GsMagritteExamples >> pointDescription [
  <magritteDescription>
  ^ GsPointDescription new
    accessor: #point
]
