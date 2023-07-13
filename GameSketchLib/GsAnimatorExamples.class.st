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
      00 -> {-25@200. #linear}.
      10 -> {320@430. #linear}.
      20 -> {615@240. #linear}}
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
