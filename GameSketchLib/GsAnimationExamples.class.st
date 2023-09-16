"
I provide some tests and examples for {{gtClass:GsAnimation}}.
"
Class {
	#name : #GsAnimationExamples,
	#superclass : #Object,
	#classInstVars : [
		'dsc2'
	],
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsAnimationExamples class >> blueSquare [
  <gtExample>
  ^ GsRectShape new size: 32@32;
      background: Color blue;
      border: Color black;
      relocate: 320@ -16.
]

{ #category : #accessing }
GsAnimationExamples class >> bouncingSquare [
  <gtExample>
  ^ self sceneWithSquare currentAnimation
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
GsAnimationExamples class >> magritteExample [
  <gtExample>
  | ani dsc scn gjw jsn md| 
  ani := self bouncingSquare.
  scn := ani sketch.
  dsc := scn animationsDescription.
  md := scn magritteDescription.
  ^ md
"  self assert: ((dsc read: scn) at: #default)  equals: ani.
  gjw := GsJsonWriter new.
  gjw write: scn.
  ^ jsn := gjw stream contents."
]

{ #category : #examples }
GsAnimationExamples class >> pathmapAnimation [
  <gtExample>
  ^ self pathmapScene currentAnimation
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
GsAnimationExamples class >> pathmapScene [
  <gtExample>
  <returns:#GsScene>
  |demo scene root|
  scene := GsScene new 
    addChild: (root := GsObject new
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
  ^scene
]

{ #category : #accessing }
GsAnimationExamples class >> sceneWithSquare [
  <gtExample>
  <returns:#GsScene>
  ^ GsScene new size: 640@480;
    addChild:(GsRectShape new
      size: 50@50;
      background: Color red;
      border: (Color  fromHexString: '990000' );
      relocate: -25@200;
      transformDo: [:t | t rotateBy: 30; apply ])
    as: #square.
]

{ #category : #accessing }
GsAnimationExamples class >> twoMovingSquares [
  <gtExample>
  |scene|
  scene := self bouncingSquare sketch.
  scene addChild: self blueSquare as: #blueSquare.
  ^ scene currentAnimation
      addTrackFor: #( blueSquare position )
      withKeys: {
        00 -> {320@ -16. #bounceOut}.
        20 -> {320@ 448. #linear}}.
]

{ #category : #accessing }
GsAnimationExamples >> titleCardScene [
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
GsAnimationExamples >> titleCardSceneWithAnimatedPosition [
  <gtExample>
  ^ (self titleCardScene currentAnimation)
    addTrackFor: #( stripe position )
    withKeys: {
      00 -> {128@ -32. #linear}.
      12 -> {128@ 256. #linear}.
      18 -> {  0@ 256. #linear}}.
]

{ #category : #accessing }
GsAnimationExamples >> titleCardWithAnimatedPositionAndSize [
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
GsAnimationExamples >> titleCardWithAnimatedPositionAndSizeAndText [
  <gtExample>
  ^ self titleCardWithAnimatedPositionAndSize
    addTrackFor: #( text lengthShown )
    withKeys: {
      00 -> { 0. #linear}.
      12 -> { 0. #linear}.
      "next one probably should be 1920"
      20 -> { 32. #linear}}.
]
