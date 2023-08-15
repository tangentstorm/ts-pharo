"
I decorate  a {{gtClass:GsScene}} with a {{gtClass:GsTool}}and a selection, as well as a special ""glass"" layer for providing ""design time"" UI decorations.
"
Class {
	#name : #GsShape,
	#superclass : #GsObject,
	#instVars : [
		'x',
		'y',
		'w',
		'h',
		'borderWidth',
		'element'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsShape class >> newFromData: dict [
  | sketch |
  sketch :=  (dict at: 't') caseOf: {
    ['rect'] -> [GsRectShape new].
    ['ellipse'] -> [GsEllipseShape new].
    ['text'] -> [GsTextShape new].
    ['path'] -> [GsPathShape new]}
  otherwise: [self error: 'unknown sketch type:', dict asString].
  ^ sketch id: (dict at: 'id'); fromData: dict
]

{ #category : #accessing }
GsShape >> bgColor [
	^ bgColor
]

{ #category : #accessing }
GsShape >> bgColor: aColor [
	bgColor := aColor
]

{ #category : #accessing }
GsShape >> descriptionBgColor [
  "<magritteDescription>"
  ^ MAColorDescription new
    accessor: #bgColor;
    priority: 10;
    label: 'bg color';
    yourself
]

{ #category : #accessing }
GsShape >> descriptionH [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #h;
    default: 30;
    priority: 3;
    kind: Object;
    yourself    
]

{ #category : #accessing }
GsShape >> descriptionLabel [
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #label;
    priority: 10;
    label: 'label';
    yourself
]

{ #category : #accessing }
GsShape >> descriptionW [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #w;
    default: 90;
    priority: 3;
    kind: Object;
    yourself
]

{ #category : #accessing }
GsShape >> descriptionX [
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #x;
	default: 0;
	priority: 1;
	kind: Object;
    yourself
]

{ #category : #accessing }
GsShape >> descriptionY [
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
GsShape >> h [
	^ h
]

{ #category : #accessing }
GsShape >> h: anObject [
	h := anObject
]

{ #category : #initialization }
GsShape >> initialize [
  super initialize.
  x := y := w := h := 0.
  element := self makeElement.
  visuals := GsStyle default.
]

{ #category : #initialization }
GsShape >> makeElement [
  "each subclass should override/extend this"
  ^ BlElement new
]

{ #category : #accessing }
GsShape >> w [
	^ w
]

{ #category : #accessing }
GsShape >> w: anObject [
	w := anObject
]

{ #category : #accessing }
GsShape >> x [
	^ x
]

{ #category : #accessing }
GsShape >> x: anObject [
	x := anObject
]

{ #category : #accessing }
GsShape >> y [
	^ y
]

{ #category : #accessing }
GsShape >> y: anObject [
	y := anObject
]
