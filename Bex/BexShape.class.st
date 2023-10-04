Class {
	#name : #BexShape,
	#superclass : #BrFrame,
	#instVars : [
		'sym',
		'symNext',
		'lerpVal',
		'pos'
	],
	#category : #'Bex-Drawing'
}

{ #category : #accessing }
BexShape class >> settingsFor: sym [
  ^ {
  #x0 -> {'x₀'. '#ffffff'.  '#597dce'. 0}.
  #x1 -> {'x₁'. '#ffffff'.  '#597dce'. 0}.
  #x2 -> {'x₂'. '#ffffff'.  '#597dce'. 0}.
  #x3 -> {'x₃'. '#ffffff'.  '#597dce'. 0}.
  #x4 -> {'x₄'. '#ffffff'.  '#597dce'. 0}.
  #O -> {'⊥' asRopedText bold.  '#ffffff'.  '#222222'. 0}.
  #I -> {'⊤' asRopedText bold.  '#000000'.  '#eeeeee'. 0}.
  #xor -> {'≠'.  '#000000'. '#d2aa99'. 20}.
  #and -> {'∧' asRopedText bold.  '#000000'. '#d27d2c'. 20}.
  #or -> {'∨' asRopedText bold.  '#000000'. '#dad45e'. 20}
  } asDictionary at: sym ifAbsent: [
    self error:
      'Don''t know how to make BexShape for: ', sym asString].
]

{ #category : #accessing }
BexShape class >> symbol: aSymbol [
  ^ self new symbol: aSymbol
]

{ #category : #accessing }
BexShape class >> symbols [
  ^ #(x0 x1 x2 x3 x4 I O and or xor)
]

{ #category : #accessing }
BexShape >> asString [
  ^ self symbol asString, self id asString
]

{ #category : #accessing }
BexShape >> cornerRadius [
  ^ self geometry cornerRadii topLeft
]

{ #category : #accessing }
BexShape >> cornerRadius: aNumber [
  self geometry: (BlRoundedRectangleGeometry
    cornerRadius: aNumber)
]

{ #category : #accessing }
BexShape >> cornerRadiusDescription [
  <magritteDescription>
  ^ MANumberDescription new
    label: 'corner radius';
    accessor: #cornerRadius
]

{ #category : #accessing }
BexShape >> initialize [
  super initialize.
  pos := 0@0
]

{ #category : #accessing }
BexShape >> intendedPosition [
  "the intended position, even before layout"
  ^ pos
]

{ #category : #accessing }
BexShape >> positionDescription [
  <magritteDescription>
  ^ GsPointDescription new
    label: 'position';
    accessor: #gsPosition
]

{ #category : #accessing }
BexShape >> relocate: aPoint [
  super relocate: aPoint.
  pos := aPoint
]

{ #category : #accessing }
BexShape >> symbol [
  ^ sym
]

{ #category : #accessing }
BexShape >> symbol: aSymbol [
  | o |
  o := self class settingsFor: aSymbol.
  sym := aSymbol.
  self
    size: 40@40;
    gsFill: o third;
    margin: (BlInsets right: 10);
    border: Color black;
      geometry: (BlRoundedRectangleGeometry
        cornerRadius: o fourth);
    removeChildren;
    addChild:(GsTextShape new
      constraintsDo: [:c |
        c frame vertical alignCenter.
        c frame horizontal alignCenter ];
    text: o first;
    textColor: o second;
    padding: (BlInsets all: 0; bottom: 4);
      fontName: 'Consolas'; fontSize: 20)
]

{ #category : #accessing }
BexShape >> symbolDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    label: 'symbol';
    accessor: #symbol;
    options: self class symbols
]
