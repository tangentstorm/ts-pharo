Class {
	#name : #GsAnimatorExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsAnimatorExamples class >> bouncingSquare [
  ^ self sceneWithSquare
    addTrackFor: #( square position )
    withKeys: {
      00 -> (0@200).
      10 -> (320@480).
      20 -> (640@ 240)}
]

{ #category : #accessing }
GsAnimatorExamples class >> sceneWithSquare [
  <returns:#GsAnimator>
  |square|
  square := BlElement new
    size: 50@50;
    background: Color red;
    border: (Color  fromHexString: '990000' );
    relocate: -25@200.
  ^ GsAnimator new
      addSceneChild: square as: #square
]
