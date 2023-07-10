"
I draw a grid on the screen.
(Actually, currently I only have vertical lines.)

"
Class {
	#name : #GsGridUi,
	#superclass : #GsObject,
	#instVars : [
		'cw',
		'ch',
		'gw',
		'gh',
		'cw2',
		'nf'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #initialization }
GsGridUi >> initialize [
  super initialize.
  cw := 20.  "column width"
  nf := 100. "num frames"
  ch := 65536. "column height (arbitrary big num)"
  self
    addChild: self makeColumns as: #columns;
    addChild: self makeLabels as: #labels;
    size: nf*cw @ ch.

]

{ #category : #initialization }
GsGridUi >> makeColumns [
  ^ BlElement new
    width: nf * cw;
    height: 65536;
    "background: Color veryLightGray;"
    border: Color darkGray;
    addChildren: ((0 to: nf) collect: [:i| |x y|
      x := i * cw. y := (i % 5) sign * 4 .
      BlElement new
        geometry: (BlLine from: x@y  to: x@ch);
        border: (((i % 5) = 0)
          ifFalse: [Color veryVeryLightGray]
          ifTrue: [Color darkGray])]).
]

{ #category : #accessing }
GsGridUi >> makeLabels [
  ^ BrHorizontalPane new
    addChildren: ((0 to: 10) collect: [:i| |txt|
      txt := (i*10) asString asRopedText.
      (txt from: 1 to: txt size)
        fontSize: 10;
        foreground: Color darkGray.
      BlTextElement new 
        padding: (BlInsets top: 4 left: 2);
        text: txt;
        size: cw * 10 - 2 @ 16]);
    fitContent.
]
