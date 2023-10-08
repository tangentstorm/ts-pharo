Class {
	#name : #BexNodeShape,
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
BexNodeShape class >> settingsFor: sym [
  ^ {
  #x0 -> {'x₀'. '#ffffff'.  '#597dce'. 0}.
  #x1 -> {'x₁'. '#ffffff'.  '#597dce'. 0}.
  #x2 -> {'x₂'. '#ffffff'.  '#597dce'. 0}.
  #x3 -> {'x₃'. '#ffffff'.  '#597dce'. 0}.
  #x4 -> {'x₄'. '#ffffff'.  '#597dce'. 0}.
  #br0 -> {'x₀'. '#ffffff'.  '#597dce'. 20}.
  #br1 -> {'x₁'. '#ffffff'.  '#597dce'. 20}.
  #br2 -> {'x₂'. '#ffffff'.  '#597dce'. 20}.
  #br3 -> {'x₃'. '#ffffff'.  '#597dce'. 20}.
  #br4 -> {'x₄'. '#ffffff'.  '#597dce'. 20}.
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
BexNodeShape class >> symbol: aSymbol [
  ^ self new symbol: aSymbol
]

{ #category : #accessing }
BexNodeShape class >> symbols [
  ^ #(x0 x1 x2 x3 x4 I O and or xor br0 br1 br2 br3 br4)
]

{ #category : #accessing }
BexNodeShape >> addEdge: anEdge to: aNode [
  self childEdges: (self childEdges, {anEdge}).
  self args: (self args, {aNode}).
  aNode addParentEdge: anEdge from: self.
]

{ #category : #accessing }
BexNodeShape >> addParentEdge: anEdge from: aNode [
  self parentEdges: (self parentEdges, {anEdge}).
  self bexParents: (self bexParents, {aNode}).
]

{ #category : #accessing }
BexNodeShape >> argSymbols [
  ^ self args collect: #symbol
]

{ #category : #accessing }
BexNodeShape >> args [
  ^ self userData at: #args ifAbsentPut: [{}]
]

{ #category : #accessing }
BexNodeShape >> args: anArray [
  self userData at: #args put: anArray
]

{ #category : #accessing }
BexNodeShape >> asString [
  ^ self symbol asString, self id asString
]

{ #category : #accessing }
BexNodeShape >> bexParents [
  ^ self userData at: #bexParents ifAbsent: [{}]
]

{ #category : #accessing }
BexNodeShape >> bexParents: anArray [
  self userData at: #bexParents put: anArray
]

{ #category : #accessing }
BexNodeShape >> childEdges [
  ^ self userData at: #childEdges ifAbsent: [{}]
]

{ #category : #accessing }
BexNodeShape >> childEdges: anArray [
  ^ self userData at: #childEdges put: anArray
]

{ #category : #accessing }
BexNodeShape >> cornerRadius [
  ^ self geometry cornerRadii topLeft
]

{ #category : #accessing }
BexNodeShape >> cornerRadius: aNumber [
  self geometry: (BlRoundedRectangleGeometry
    cornerRadius: aNumber)
]

{ #category : #accessing }
BexNodeShape >> cornerRadiusDescription [
  <magritteDescription>
  ^ MANumberDescription new
    label: 'corner radius';
    accessor: #cornerRadius
]

{ #category : #accessing }
BexNodeShape >> initialize [
  super initialize.
  pos := 0@0
]

{ #category : #accessing }
BexNodeShape >> intendedPosition [
  "the intended position, even before layout"
  ^ pos
]

{ #category : #accessing }
BexNodeShape >> parentEdge [
  ^ self parentEdges ifEmpty: [nil] ifNotEmpty: [:xs| xs first]
]

{ #category : #accessing }
BexNodeShape >> parentEdges [
  ^ self userData at: #parentEdges ifAbsent: [{}]
]

{ #category : #accessing }
BexNodeShape >> parentEdges: anArray [
  self userData at: #parentEdges put: anArray
]

{ #category : #accessing }
BexNodeShape >> positionDescription [
  <magritteDescription>
  ^ GsPointDescription new
    label: 'position';
    accessor: #gsPosition
]

{ #category : #accessing }
BexNodeShape >> quoteId [
  ^ self id asSymbol quoteForRpn
]

{ #category : #accessing }
BexNodeShape >> relocate: aPoint [
  super relocate: aPoint.
  pos := aPoint
]

{ #category : #accessing }
BexNodeShape >> symbol [
  ^ sym
]

{ #category : #accessing }
BexNodeShape >> symbol: aSymbol [
  | o |
  sym := aSymbol asSymbol.
  o := self class settingsFor: sym.
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
BexNodeShape >> symbolDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    label: 'symbol';
    accessor: #symbol;
    options: self class symbols
]
