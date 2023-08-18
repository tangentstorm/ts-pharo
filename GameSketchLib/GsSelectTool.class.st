"
I allow selecting objects in a {{gtClass:GsSketch}}, either by clicking on them, or by dragging on the canvas to manipulate a {{gtClass:GsSelectangle}}.
"
Class {
	#name : #GsSelectTool,
	#superclass : #GsTool,
	#instVars : [
		'selectangle',
		'subject',
		'selection'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsSelectTool >> click: p [
  self selection:(
    (scene childAtPoint: p) ifNil:[{}]
    ifNotNil:[:x|{x}])
]

{ #category : #accessing }
GsSelectTool >> dragEnd: p [
  |rect|
  subject ifNil: [
    rect := selectangle bounds asRectangle.
    self selection: (scene children select: [:x|
         x bounds asRectangle intersects: rect])]
]

{ #category : #'event handling' }
GsSelectTool >> dragStart: p [
  super dragStart: p.
  selectangle removeFromParent.
  (subject := scene childAtPoint: p)
    ifNil: [overlay addChild:
      (selectangle relocate:p; size:0@0)]
    ifNotNil: [
      startPoint := subject position-p]
]

{ #category : #accessing }
GsSelectTool >> dragStep: p [
  subject ifNil: [|rect|
    rect := Rectangle point: startPoint point: p.
    selectangle relocate: rect topLeft; size: rect extent]
  ifNotNil: [subject relocate: p + startPoint]
]

{ #category : #initialization }
GsSelectTool >> initialize [
  super initialize.
  selectangle := BlElement new
   border: (BlBorder paint: Color cyan).
]

{ #category : #accessing }
GsSelectTool >> label [
  ^ 'select'
]

{ #category : #accessing }
GsSelectTool >> selectangle [
	^ selectangle
]

{ #category : #accessing }
GsSelectTool >> selectangle: anObject [
	selectangle := anObject
]

{ #category : #accessing }
GsSelectTool >> selection: aCollection [
  selection := aCollection asArray.
  overlay removeChildren.
  overlay addChildren: (selection collect: [:x| |rect b|
    rect := x bounds asRectangle.
    b := BlElement new
      border: (BlBorder paint: Color cyan);
      background: (Color cyan alpha: 0.2);
      size: rect extent;
      relocate: rect topLeft;
      addEventHandler: BlPullHandler new;
      when: BlMouseDownEvent do: [:e| 
        "without this, overlay gets mouse events."
        e  consumed: true];
      when: BlElementPositionChangedEvent do: [:e|
          x relocate: b position]])
]

{ #category : #accessing }
GsSelectTool >> subject [
	^ subject
]
