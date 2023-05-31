Class {
	#name : #GsCell,
	#superclass : #Object,
	#instVars : [
		'fg',
		'bg',
		'value'
	],
	#category : #GameSketchLib
}

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

{ #category : #accessing }
GsCell >> value1 [
	^ value
]

{ #category : #accessing }
GsCell >> value: anObject [
	value := anObject
]
