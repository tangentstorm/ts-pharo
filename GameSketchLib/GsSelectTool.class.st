"
I allow selecting objects in a {{gtClass:GsSketch}}, either by clicking on them, or by dragging on the canvas to manipulate a ""selectangle"".

The list of selected shapes is stored in a {{gtClass:GsSelection}}provided by   {{gtClass:GsToolApp}} for sharing with other tools.

"
Class {
	#name : #GsSelectTool,
	#superclass : #GsTool,
	#instVars : [
		'selectangle',
		'subject',
		'startPos',
		'offset',
		'selectionBounds'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsSelectTool >> click: p [
  self selectShapes:
    ((self scene childAtPoint: p)
      ifNil: [{}]
      ifNotNil: [:x| {x}])
]

{ #category : #'event handling' }
GsSelectTool >> dragStart: p [
  super dragStart: p.
  selectangle removeFromParent.
  (subject := self scene childAtPoint: p)
    ifNil: [overlay addChild:
      (selectangle relocate:p; size:0@0)]
    ifNotNil: [ offset := subject gsPosition - p. ].
]

{ #category : #accessing }
GsSelectTool >> dragStep: p [
  subject ifNil: [|rect|
    rect := Rectangle point: startPoint point: p.
    selectangle relocate: rect topLeft; size: rect extent]
  ifNotNil: [subject gsPosition: p + offset ]
]

{ #category : #accessing }
GsSelectTool >> dragStop: p [
  |rect|
  subject ifNil: [
    rect := selectangle boundingRect asRectangle.
    self selectShapes: (self scene children select: [:x|
         x boundingRect asRectangle intersects: rect])]
]

{ #category : #ui }
GsSelectTool >> drawSelectionBox [
  selection ifNotEmpty: [
    |rect startPosition|
    rect := selection boundingRect.
    overlay addChild: (GsRectShape new
      border: (BlBorder paint: Color cyan);
      background: (Color cyan alpha: 0.2);
      size: rect extent;
      relocate: rect topLeft;
      addEventHandler: BlPullHandler new;
      when: BlMouseDownEvent do: [:e| 
        startPosition := e source gsPosition.
        e  consumed: true];
      when: BlElementPositionChangedEvent do: [:e|
        "ignore the initial positioning event."
        startPosition ifNotNil: [ |diff|
          diff := e source gsPosition - startPosition.
          startPosition := e source gsPosition.
          selection do: [:x | x gsPosition: x gsPosition + diff]]])]
]

{ #category : #initialization }
GsSelectTool >> initialize [
  super initialize.
  selectangle := BlElement new
    border: (BlBorder paint: Color cyan).
]

{ #category : #accessing }
GsSelectTool >> selectShapes: aCollection [
  overlay removeChildren.
  selection reset; addAll: aCollection.
  (aCollection size > 1)
    ifTrue: [self drawSelectionBox]
    ifFalse: [selection ifNotEmpty: [
      overlay addChildren:
        aCollection first gsHandles]]
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
GsSelectTool >> subject [
	^ subject
]
