"
I am a big transparent rectangle that covers a {{gtClass:GsScene}}, listens for mouse events, and relays them to the current {{gtClass:GsTool}}.

I am used by {{gtClass:GsToolApp}} instances to edit a scene.

"
Class {
	#name : #GsToolOverlay,
	#superclass : #GsObject,
	#instVars : [
		'scene',
		'dragging',
		'mouseDown',
		'onDrag',
		'startPoint',
		'onClick',
		'onMouseMove',
		'onDragStart',
		'onDragEnd',
		'lastMousePosition',
		'tool',
		'coords'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsToolOverlay class >> for: aScene [
  ^ self new scene: aScene
]

{ #category : #accessing }
GsToolOverlay >> click: aPoint [
  onClick cull: aPoint.
  tool click: aPoint.
]

{ #category : #'event handling' }
GsToolOverlay >> drag: aPoint [
  onDrag value: aPoint.
  tool dragStep: aPoint.
]

{ #category : #'event handling' }
GsToolOverlay >> dragEnd: aPoint [
  onDragEnd cull: aPoint.
  tool dragEnd: aPoint.
]

{ #category : #'event handling' }
GsToolOverlay >> dragStart: aPoint [ 
  onDragStart cull: aPoint.
  tool dragStart: aPoint.
]

{ #category : #debugging }
GsToolOverlay >> drawCoords: aPoint [
  coords text: (aPoint rounded asString, ' ', 
    ((scene childAtPoint: aPoint) ifNil: ['']
       ifNotNil: #asString)) asRopedText
]

{ #category : #accessing }
GsToolOverlay >> initCallbacks [
  onClick := [:p|].
  onMouseMove := [:p|].
  onDragStart := [:p|].
  onDrag := [:p|].
  onDragEnd := [:p|]
]

{ #category : #accessing }
GsToolOverlay >> initialize [
  super initialize.
  tool := GsSelectTool new overlay: self.
  self matchParent;
    resetFlags;
    initCallbacks; 
    addChild: self makeCoords;
    when: BlMouseDownEvent do: [:e|
      self resetFlags.
      startPoint := e localPosition.
      mouseDown := true];
    when: BlMouseMoveEvent do: [:e|
      |p| p:= e localPosition.
      self drawCoords: p.
      mouseDown ifTrue: [
        dragging
          ifFalse: [
            dragging := true.
            self dragStart: startPoint  ].
        self drag:p. ]
      ifFalse: [ self mouseMove: p]];
    when: BlMouseUpEvent do: [:e|
      |p| p := e localPosition.
      mouseDown := false.
      dragging ifTrue: [ dragging := false. self dragEnd: p ]
      ifFalse: [ self click: p ]].
]

{ #category : #accessing }
GsToolOverlay >> makeCoords [
  ^ coords := BlTextElement new
    text:'' asRopedText;
    relocate: 5@5.
]

{ #category : #accessing }
GsToolOverlay >> mouseMove: aPoint [
  onMouseMove cull: aPoint 
]

{ #category : #initialization }
GsToolOverlay >> onClick: aBlock [
  onClick := aBlock 
]

{ #category : #accessing }
GsToolOverlay >> onDrag: aBlock [
  onDrag := aBlock
]

{ #category : #accessing }
GsToolOverlay >> onDragEnd: aBlock [
  onDragEnd := aBlock
]

{ #category : #accessing }
GsToolOverlay >> onDragStart: aBlock [
  onDragStart := aBlock
]

{ #category : #initialization }
GsToolOverlay >> onMouseMove: aBlock [
  onMouseMove := aBlock
]

{ #category : #accessing }
GsToolOverlay >> resetFlags [
  mouseDown := false.
  mouseMoved := false.
  dragging := false.
]

{ #category : #accessing }
GsToolOverlay >> scene: aScene [
  scene := aScene.
  tool scene: scene.
]

{ #category : #accessing }
GsToolOverlay >> tool [
  ^ tool
]

{ #category : #accessing }
GsToolOverlay >> tool: aTool [
  tool := aTool.
  tool scene: scene; overlay: self.
]
