"
I draw a value inside a rectangular box.
The intent is to visualize the contents of an array cell.
"
Class {
	#name : #GsCell,
	#superclass : #Object,
	#instVars : [
		'fg',
		'bg',
		'item'
	],
	#category : #GameSketchLib
}

{ #category : #'instance creation' }
GsCell class >> for: item [
  ^ self new data: item; yourself
]

{ #category : #'instance creation' }
GsCell class >> rs: item [
  ^ (self for: item) asRS
]

{ #category : #accessing }
GsCell >> asElement [
^BrVerticalPane new alignCenter
  size: 32@32;
  background: bg;
  border: (BlBorder paint: Color black);
  addChild: (BlTextElement new text: (
    (value asString) asRopedText
      fontName:'consolas';
      foreground: fg))
]

{ #category : #roassal }
GsCell >> asRS [
  "convert to shape for Roassal"
  ^ RSBox new extent: 32@32; model:self;
		color: bg; border: (RSBorder new color: #black; width:0.2);
      addInteraction: self rsLabel
]

{ #category : #accessing }
GsCell >> bg [
	^ bg
]

{ #category : #accessing }
GsCell >> bg: anObject [
	bg := anObject
]

{ #category : #accessing }
GsCell >> fg [
	^ fg
]

{ #category : #accessing }
GsCell >> fg: anObject [
	fg := anObject
]

{ #category : #accessing }
GsCell >> gtSketchFor: aView [
  <gtView>
  ^ aView explicit
      title: 'Sketch';
      stencil: self asElement
    
]

{ #category : #accessing }
GsCell >> initialize [
  super initialize.
  bg := Color white.
  fg := Color black.
  value := ''
]
