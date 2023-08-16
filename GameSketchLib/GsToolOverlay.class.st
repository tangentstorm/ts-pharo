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
		'lastMousePosition'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsToolOverlay >> click: aPoint [
  onClick cull: aPoint 
]

{ #category : #'event handling' }
GsToolOverlay >> drag: aPoint [
  onDrag value: aPoint
]

{ #category : #'event handling' }
GsToolOverlay >> dragEnd: aPoint [
  onDragEnd cull: aPoint 
]

{ #category : #'event handling' }
GsToolOverlay >> dragStart: aPoint [ 
  onDragStart cull: aPoint
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
  self resetFlags.
  self initCallbacks.
  self matchParent
    when: BlMouseDownEvent do: [:e|
      self resetFlags.
      startPoint := e localPosition.
      mouseDown := true];
    when: BlMouseMoveEvent do: [:e|
      mouseDown ifTrue: [
        dragging
          ifFalse: [
            dragging := true.
            self dragStart: startPoint  ].
        self drag: e localPosition ]
      ifFalse: [ self mouseMove: e localPosition]];
    when: BlMouseUpEvent do: [:e|
      mouseDown := false.
      dragging ifTrue:
        [ dragging := false. self dragEnd: e localPosition ]
      ifFalse: [ self click: e localPosition]].
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
