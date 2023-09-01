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
  self assert: c gsJson
     equals: '{"class":"GsCircleShape", "id":"shape001", "fill":"#FFFFFF", "center":"(0@0)", "radius":10}'.
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
  |c s |
  c := self circleShape.
  s := GsScene new addChild: c. "Note that scenes have a default background color."
  self assert: s gsJson
     equals: '{"class":"GsScene", "fill":"#9F9F9F", "children":[
  {"class":"GsCircleShape", "id":"shape001", "fill":"#FFFFFF", "center":"(0@0)", "radius":10}]}'
  
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
