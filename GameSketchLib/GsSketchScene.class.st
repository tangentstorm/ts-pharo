Class {
	#name : #GsSketchScene,
	#superclass : #BlElement,
	#instVars : [
		'current'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsSketchScene >> current [
	^ current
]

{ #category : #accessing }
GsSketchScene >> current: anObject [
	^ current := anObject
]

{ #category : #accessing }
GsSketchScene >> initialize [
  super initialize.
  self constraintsDo: [ :c |
    c horizontal matchParent.
    c vertical matchParent ];
  background: GsColors defaultBg;
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    self addChild: (current := self makeNode).
    current relocate: e localPosition - (5@5)].
]

{ #category : #accessing }
GsSketchScene >> makeNode [
  |node|
node := BrVerticalPane new size: 75@45;
  background: Color white;
  addEventHandler: BlPullHandler new;
  when: BlMouseDownEvent do: [:e|
    current := node];
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    node background: Color random].
^ node
]
