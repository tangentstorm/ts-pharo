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
  <returns:#GsPlayerApp>
  |demo gsa root|
  gsa := GsPlayerApp new
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
  <returns:#GsPlayerApp>
  |square|
  square := GsRectShape new
    size: 50@50;
    background: Color red;
    border: (Color  fromHexString: '990000' );
    relocate: -25@200.
  square transform rotateBy: 30; apply.
  ^ GsPlayerApp new
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

{ #category : #accessing }
GsAnimatorExamples >> titleCardScene [
  <gtExample>
  |scene |
  scene := (GsJsonReader new read:
'{"class":"GsScene", "fill":"#223344", "strokeColor":"", "children":[
  {"class":"GsRectShape", "id":"stripe", "wh":"(800@100)", "xy":"(0@110)", "fill":"#005784", "strokeColor":"" },
  {"class":"GsTextShape", "id":"text", "textColor":"#ffffff", "fontName":"Kulim Park", "gsText":"Hello, world!",
    "gsPosition":"(128@254)", "fontSize":80 }]}').
  scene inUIProcessDo: [ 
    (scene childNamed: #text) fullSpan bold ].
  scene size: 800@600.   
  ^ scene
]

{ #category : #accessing }
GsAnimatorExamples >> titleCardSceneWithAnimatedPosition [
  <gtExample>
  ^ (GsPlayerApp new scene: self titleCardScene)
    addTrackFor: #( stripe position )
    withKeys: {
      00 -> {128@ -32. #linear}.
      12 -> {128@ 256. #linear}.
      18 -> {  0@ 256. #linear}}.
]

{ #category : #accessing }
GsAnimatorExamples >> titleCardWithAnimatedPositionAndSize [
  <gtExample>
  ^ self titleCardSceneWithAnimatedPosition
    addTrackFor: #( stripe size )
    withKeys: {
      00 -> { 32@ 32. #linear}.
      12 -> { 32@136. #linear}.
      "next one probably should be 1920"
      20 -> { 800@136. #linear}}.
]

{ #category : #accessing }
GsAnimatorExamples >> titleCardWithAnimatedPositionAndSizeAndText [
  <gtExample>
  ^ self titleCardWithAnimatedPositionAndSize
    addTrackFor: #( text lengthShown )
    withKeys: {
      00 -> { 0. #linear}.
      12 -> { 0. #linear}.
      "next one probably should be 1920"
      20 -> { 32. #linear}}.
]
