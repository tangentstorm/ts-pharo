Class {
	#name : #GsPhysicsBody,
	#superclass : #Object,
	#instVars : [
		'mass',
		'vel',
		'acc',
		'forces',
		'pos',
		'shape',
		'radius',
		'old'
	],
	#category : #'GameSketchLib-Physics'
}

{ #category : #accessing }
GsPhysicsBody >> addForce: aForce [
  forces add: aForce
]

{ #category : #accessing }
GsPhysicsBody >> initialize [
  super initialize.
  mass := 1.0.
  radius := 10.
  old := pos := acc := 0.0 asPoint.
  vel := 0.5@0.
  forces := OrderedCollection new.
]

{ #category : #accessing }
GsPhysicsBody >> mass [
	^ mass
]

{ #category : #accessing }
GsPhysicsBody >> mass: aNumber [
  mass := aNumber
]

{ #category : #accessing }
GsPhysicsBody >> pos [
  ^ pos
]

{ #category : #accessing }
GsPhysicsBody >> pos: aPoint [
  old := pos := aPoint
]

{ #category : #accessing }
GsPhysicsBody >> shape: aShape [
  shape := aShape
]

{ #category : #accessing }
GsPhysicsBody >> stayInBounds: aPoint [
  self subclassResponsibility
]

{ #category : #accessing }
GsPhysicsBody >> step [
  | dt |
  dt := 0.1.

  acc := 0.0 asPoint.
  "f=ma, so a=f/m"
  forces do: [:f | acc := acc + (f / mass) ].

  self step: dt.
  self stayInBounds: 640@480.
  
  shape ifNotNil: [ shape gsCenter: pos  ]  
]

{ #category : #accessing }
GsPhysicsBody >> step: dt [
  self subclassResponsibility
]
