"
I provide some examples for using {{gtClass:GsAnimator}}.
"
Class {
	#name : #GsAnimatorExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsAnimatorExamples class >> blueSquare [
  <gtExample>
  ^ GsRectShape new size: 32@32;
      background: Color blue;
      border: Color black;
      relocate: 320@ -16.
]

{ #category : #accessing }
GsAnimatorExamples class >> bouncingSquare [
  <gtExample>
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

{ #category : #examples }
GsAnimatorExamples class >> pathmapAnimation [
  <gtExample>
  ^ self pathmapScene
  addTrackFor: #(root position) withKeys: {
    00 -> { 208 @224. #linear }.
    05 -> { 208 @224. #linear }.
    10 -> { (208 -16) @224. #linear }.
    15 -> { (208 -16) @224. #linear }.
    20 -> { (208 -48) @224. #linear }.};
  addTrackFor: #(n1 position) withKeys: {
    00 -> { 0@0. #linear }.
    05 -> { 0@ -48. #linear }.
    10 -> { 48@ -48. #linear}.
    15 -> { 48@ -96. #linear}.
    20 -> { 144@ -96. #linear}};
  addTrackFor: #(n2 position) withKeys: {
    00 -> { 32@0. #linear }.
    10 -> { 32@ 0. #linear}.
    15 -> { 32@ -48. #linear}.
    20 -> { 112@ -48. #linear}};
  addTrackFor: #(n3 position) withKeys: {
    00 -> { 64@0. #linear }.
    10 -> { 64@ 0. #linear}.
    15 -> { 64@ -48. #linear}.
    20 -> { 176@ -48. #linear}}.
]

{ #category : #accessing }
GsAnimatorExamples class >> pathmapScene [
  <gtExample>
  <returns:#GsAnimator>
  |demo gsa root|
  gsa := GsAnimator new
    addSceneChild: (root := GsObject new
      relocate: 208@224;
      clipChildren: false)
    as: #root.
  demo := GsPathmapDemo new degree: 2; depth: 3.
  demo mondrian topStep root: root.
  demo mondrian nodes stencil: [:i|
    (GsCell for: i+1) asElement
      background: GsColor gold;
      id: ('n', (i + 1) asString) asSymbol].
  demo mondrian edges stencil: [
    BlLineElement new
      border: Color black;
      constraintsDo: [:c | c ignoreByLayout ];
      zIndex: -1].
  demo makeGraph: true layout: #horizontal.
  ^gsa
]

{ #category : #accessing }
GsAnimatorExamples class >> sceneWithSquare [
  <gtExample>
  <returns:#GsAnimator>
  |square|
  square := GsRectShape new
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
  <gtExample>
  ^ self bouncingSquare
    addSceneChild: self blueSquare as: #blueSquare;
    addTrackFor: #( blueSquare position )
    withKeys: {
      00 -> {320@ -16. #bounceOut}.
      20 -> {320@ 448. #linear}}
    
]
