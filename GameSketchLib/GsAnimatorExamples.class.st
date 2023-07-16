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
      20 -> {615@240. #linear}};
    addTrackFor: #( square rotation )
    withKeys: {
      00 -> {30. #linear}.
      10 -> {90. #linear}.
      20 -> {120. #linear}}      
]

{ #category : #accessing }
GsAnimatorExamples class >> makeBlueSquare [
  ^ BlElement new size: 32@32;
      background: Color blue;
      border: Color black;
      relocate: 320@ -16.
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
  square transform rotateBy: 30; apply.
  ^ GsAnimator new
      addSceneChild: square as: #square
]

{ #category : #accessing }
GsAnimatorExamples class >> twoMovingSquares [
  ^ self bouncingSquare
    addSceneChild: self makeBlueSquare as: #blueSquare;
    addTrackFor: #( blueSquare position )
    withKeys: {
      00 -> {320@ -16. #bounceOut}.
      20 -> {320@ 448. #linear}}
    
]
