"
I am an experimental class that provides some magritte forms that allow inspecting and editing individual elements of a node in a scene.

(Unfortunately, the form is very flat at the moment because I don't really understand Magritte and also Glamorous doesn't sem to render all the magritte concepts out of the box.)

Other than that I am more or less a knockoff of {{gtClass:GsCell}}
"
Class {
	#name : #GsNodeSketch,
	#superclass : #GsShape,
	#instVars : [
		'rect',
		'label',
		'borderColor',
		'fontName',
		'shape'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsNodeSketch >> asElement [
  ^ BrVerticalPane new alignCenter
    relocate: self x asNumber @ self y asNumber;
    size: self w asNumber @ self h asNumber;
    background: self bgColor;
    addChild: (BlTextElement new
      padding: (BlInsets all: 5);
      text: self label asRopedText)
]

{ #category : #accessing }
GsNodeSketch >> gtSceneFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Scene';
    stencil: [GsScene new addChild: self asElement]
]

{ #category : #accessing }
GsNodeSketch >> initialize [
  super initialize.
  x := y := 0.
  w := 90. h:= 30.
  label := 'New Node'.
  bgColor := Color veryVeryLightGray.
]

{ #category : #accessing }
GsNodeSketch >> label [
	^ label
]

{ #category : #accessing }
GsNodeSketch >> label: anObject [
	label := anObject
]
