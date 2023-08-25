"
I allow selecting objects in a {{gtClass:GsSketch}}, either by clicking on them, or by dragging on the canvas to manipulate a {{gtClass:GsSelectangle}}.
"
Class {
	#name : #GsSelectTool,
	#superclass : #GsTool,
	#instVars : [
		'selectangle',
		'subject',
		'selection',
		'startPos',
		'offset'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsSelectTool >> click: p [
  selection := nil.
  overlay removeChildren.
  (scene childAtPoint: p) ifNotNil:[:x|
    overlay addChildren: x shapeHandles ]
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
    ifNotNil: [ offset := subject shapePosition - p. ].
]

{ #category : #accessing }
GsSelectTool >> dragStep: p [
  subject ifNil: [|rect|
    rect := Rectangle point: startPoint point: p.
    selectangle relocate: rect topLeft; size: rect extent]
  ifNotNil: [subject shapePosition: p + offset ]
]

{ #category : #initialization }
GsSelectTool >> initialize [
  super initialize.
  selectangle := BlElement new
   border: (BlBorder paint: Color cyan).
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
GsSelectTool >> selection [
  ^ selection
]

{ #category : #accessing }
GsSelectTool >> selection: aCollection [
  selection := aCollection asArray.
  overlay removeChildren.
  "TODO: select a single item: just show handles"
  "(otherwise this acts like temporary group)" 
  (selection size >= 1) ifTrue: [
    |rect startPosition|
    rect := selection first bounds asRectangle.
    selection do: [:x| rect := rect merge: x bounds asRectangle].
    overlay addChild: (GsRectShape new
      border: (BlBorder paint: Color cyan);
      background: (Color cyan alpha: 0.2);
      size: rect extent;
      relocate: rect topLeft;
      addEventHandler: BlPullHandler new;
      when: BlMouseDownEvent do: [:e| 
        startPosition := e source shapePosition.
        e  consumed: true];
      when: BlElementPositionChangedEvent do: [:e|
        "ignore the initial positioning event."
        startPosition ifNotNil: [ |diff|
          diff := e source shapePosition - startPosition.
          startPosition := e source shapePosition.
          selection do: [:x | x shapePosition: x shapePosition + diff]]])]
]

{ #category : #accessing }
GsSelectTool >> subject [
	^ subject
]
