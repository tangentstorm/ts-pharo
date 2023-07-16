"
I am an experimental class that provides some magritte forms that allow inspecting and editing individual elements of a node in a scene.

(Unfortunately, the form is very flat at the moment because I don't really understand Magritte and also Glamorous doesn't sem to render all the magritte concepts out of the box.)

Other than that I am more or less a knockoff of {{gtClass:GsCell}}
"
Class {
	#name : #GsNode,
	#superclass : #Object,
	#instVars : [
		'rect',
		'x',
		'y',
		'w',
		'h',
		'bgColor',
		'label',
		'borderWidth',
		'borderColor',
		'fontName',
		'children',
		'shape'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsNode >> asElement [
  ^ BrVerticalPane new alignCenter
    relocate: self x asNumber @ self y asNumber;
    size: self w asNumber @ self h asNumber;
    background: self bgColor;
    addChild: (BlTextElement new
      padding: (BlInsets all: 5);
      text: self label asRopedText)
]

{ #category : #accessing }
GsNode >> bgColor [
	^ bgColor
]

{ #category : #accessing }
GsNode >> bgColor: anObject [
	bgColor := anObject
]

{ #category : #accessing }
GsNode >> descriptionBgColor [
  "<magritteDescription>"
  ^ MAColorDescription new
    accessor: #bgColor;
    priority: 10;
    label: 'bg color';
    yourself
]

{ #category : #accessing }
GsNode >> descriptionH [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #h;
    default: 30;
    priority: 3;
    kind: Object;
    yourself    
]

{ #category : #accessing }
GsNode >> descriptionLabel [
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #label;
    priority: 10;
    label: 'label';
    yourself
]

{ #category : #accessing }
GsNode >> descriptionW [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #w;
    default: 90;
    priority: 3;
    kind: Object;
    yourself
]

{ #category : #accessing }
GsNode >> descriptionX [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #x;
	default: 0;
	priority: 1;
	kind: Object;
    yourself
]

{ #category : #accessing }
GsNode >> descriptionY [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #y;
    default: 0;
    priority: 2;
    "beInteger;"
    kind: Object;
    yourself
]

{ #category : #accessing }
GsNode >> gtSceneFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Scene';
    stencil: [GsScene new addChild: self asElement]
]

{ #category : #accessing }
GsNode >> h [
	^ h
]

{ #category : #accessing }
GsNode >> h: anObject [
	h := anObject
]

{ #category : #accessing }
GsNode >> initialize [
  super initialize.
  x := y := 0.
  w := 90. h:= 30.
  label := 'New Node'.
  bgColor := Color veryVeryLightGray.
]

{ #category : #accessing }
GsNode >> label [
	^ label
]

{ #category : #accessing }
GsNode >> label: anObject [
	label := anObject
]

{ #category : #accessing }
GsNode >> w [
	^ w
]

{ #category : #accessing }
GsNode >> w: anObject [
	w := anObject
]

{ #category : #accessing }
GsNode >> x [
	^ x
]

{ #category : #accessing }
GsNode >> x: anObject [
	x := anObject
]

{ #category : #accessing }
GsNode >> y [
	^ y
]

{ #category : #accessing }
GsNode >> y: anObject [
	y := anObject
]
