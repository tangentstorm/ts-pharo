"
I decorate  a {{gtClass:GsScene}} with a {{gtClass:GsTool}}and a selection, as well as a special ""glass"" layer for providing ""design time"" UI decorations.

"
Class {
	#name : #GsSketch,
	#superclass : #GsObject,
	#instVars : [
		'x',
		'y',
		'w',
		'h',
		'bgColor',
		'borderWidth',
		'element'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsSketch class >> newFromData: dict [
  | sketch |
  sketch :=  (dict at: 't') caseOf: {
    ['rect'] -> [GsBoxSketch new].
    ['ellipse'] -> [GsEllipseSketch new].
    ['text'] -> [GsTextSketch new].
    ['path'] -> [GsPathSketch new]}
  otherwise: [self error: 'unknown sketch type:', dict asString].
  ^ sketch id: (dict at: 'id'); fromData: dict
]

{ #category : #accessing }
GsSketch >> bgColor [
	^ bgColor
]

{ #category : #accessing }
GsSketch >> bgColor: anObject [
	bgColor := anObject
]

{ #category : #accessing }
GsSketch >> descriptionBgColor [
  "<magritteDescription>"
  ^ MAColorDescription new
    accessor: #bgColor;
    priority: 10;
    label: 'bg color';
    yourself
]

{ #category : #accessing }
GsSketch >> descriptionH [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #h;
    default: 30;
    priority: 3;
    kind: Object;
    yourself    
]

{ #category : #accessing }
GsSketch >> descriptionLabel [
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #label;
    priority: 10;
    label: 'label';
    yourself
]

{ #category : #accessing }
GsSketch >> descriptionW [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #w;
    default: 90;
    priority: 3;
    kind: Object;
    yourself
]

{ #category : #accessing }
GsSketch >> descriptionX [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #x;
	default: 0;
	priority: 1;
	kind: Object;
    yourself
]

{ #category : #accessing }
GsSketch >> descriptionY [
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
GsSketch >> h [
	^ h
]

{ #category : #accessing }
GsSketch >> h: anObject [
	h := anObject
]

{ #category : #initialization }
GsSketch >> initialize [
  super initialize.
  x := y := w := h := 0.
  element := self makeElement.
]

{ #category : #initialization }
GsSketch >> makeElement [
  "each subclass should override/extend this"
  ^ BlElement new
]

{ #category : #accessing }
GsSketch >> w [
	^ w
]

{ #category : #accessing }
GsSketch >> w: anObject [
	w := anObject
]

{ #category : #accessing }
GsSketch >> x [
	^ x
]

{ #category : #accessing }
GsSketch >> x: anObject [
	x := anObject
]

{ #category : #accessing }
GsSketch >> y [
	^ y
]

{ #category : #accessing }
GsSketch >> y: anObject [
	y := anObject
]
