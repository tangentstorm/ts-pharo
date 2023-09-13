Class {
	#name : #GsPhysicsApp,
	#superclass : #GsToolApp,
	#instVars : [
		'animation',
		'bodies'
	],
	#category : #'GameSketchLib-Physics'
}

{ #category : #accessing }
GsPhysicsApp >> addBody: aBody [
  bodies add: aBody.
  aBody addForce: 0@32. "gravity"
]

{ #category : #accessing }
GsPhysicsApp >> initialTools [
  ^ { GsPhysicsTool new app: self }
]

{ #category : #accessing }
GsPhysicsApp >> initialize [
  super initialize.
  scene addAnimation: self makeAnimation.
  animation start.
  bodies := OrderedCollection new.
]

{ #category : #accessing }
GsPhysicsApp >> makeAnimation [
  ^ animation := (BlAnimation new
      when: BlAnimationStepEvent do: [:e|
        self step];
      beInfinite)
]

{ #category : #accessing }
GsPhysicsApp >> step [
  bodies do: [:each | each step ]
]
