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
		'offset'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #initialization }
GsSelectTool >> addedToApp: aToolApp [
  aToolApp selection
    whenChangedDo: [self redrawSelection]
]

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
    ifNil: [overlay addGizmo:
      (selectangle relocate:p; size:0@0)]
    ifNotNil: [
      subject gsIsPositionable ifTrue:[
        offset := subject gsPosition - p]].
]

{ #category : #accessing }
GsSelectTool >> dragStep: p [
  subject ifNil: [|rect|
    rect := (Rectangle point: startPoint point: p).
    selectangle relocate: rect topLeft; size: rect extent]
  ifNotNil: [
    subject gsIsPositionable ifTrue: [
      subject gsPosition: p + offset ]]
]

{ #category : #accessing }
GsSelectTool >> dragStop: p [
  |rect|
  subject ifNil: [
    rect := selectangle bounds asRectangle.
    self selectShapes: (self scene children select: [:x|
         x bounds asRectangle intersects: rect])]
    ifNotNil: [
      (selection includes: subject) ifTrue: [self refreshToolsForSelection] ]

]

{ #category : #ui }
GsSelectTool >> drawSelectionBox [
  selection ifNotEmpty: [
    |rect box startPosition|
    rect := selection boundingRect.
    overlay addGizmo: (box := GsRectShape new
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
          selection boundingRect: box bounds asRectangle.
          diff := e source gsPosition - startPosition.
          startPosition := e source gsPosition.
          selection positionableShapes do: [:x | x gsPosition: x gsPosition + diff]]])]
]

{ #category : #initialization }
GsSelectTool >> initialize [
  super initialize.
  selectangle := BlElement new
    border: (BlBorder paint: Color cyan).
]

{ #category : #initialization }
GsSelectTool >> redrawSelection [
  overlay removeGizmos.
  (selection size > 1)
    ifTrue: [self drawSelectionBox]
    ifFalse: [selection ifNotEmpty: [
      overlay addGizmos:
        (selection first gsHandles do:[:h|
          h when: BlPullEndEvent do: [
            self refreshToolsForSelection]];
          yourself)]]
]

{ #category : #accessing }
GsSelectTool >> refreshToolsForSelection [
  "this triggers a refresh of the inspector and any handles"
  self selectShapes: selection copy
]

{ #category : #accessing }
GsSelectTool >> selectShapes: aCollection [
  self selection reset; addAll: aCollection.
]

{ #category : #accessing }
GsSelectTool >> selectangle [
	^ selectangle
]

{ #category : #accessing }
GsSelectTool >> selectangle: anObject [
	selectangle := anObject
]
