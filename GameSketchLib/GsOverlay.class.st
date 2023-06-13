Class {
	#name : #GsOverlay,
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
		'onDragEnd'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsOverlay >> click: aPoint [
  onClick cull: aPoint 
]

{ #category : #'event handling' }
GsOverlay >> drag: aPoint [
  onDrag value: aPoint
]

{ #category : #'event handling' }
GsOverlay >> dragEnd: aPoint [
  onDragEnd cull: aPoint 
]

{ #category : #'event handling' }
GsOverlay >> dragStart: aPoint [ 
  onDragStart cull: aPoint
]

{ #category : #accessing }
GsOverlay >> initCallbacks [
  onClick := [:p|].
  onMouseMove := [:p|].
  onDragStart := [:p|].
  onDrag := [:p|].
  onDragEnd := [:p|]
]

{ #category : #accessing }
GsOverlay >> initialize [
  super initialize.
  self resetFlags.
  self initCallbacks.
  self matchParentBounds
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
GsOverlay >> mouseMove: aPoint [
  onMouseMove cull: aPoint 
]

{ #category : #initialization }
GsOverlay >> onClick: aBlock [
  onClick := aBlock 
]

{ #category : #accessing }
GsOverlay >> onDrag: aBlock [
  onDrag := aBlock
]

{ #category : #accessing }
GsOverlay >> onDragEnd: aBlock [
  onDragEnd := aBlock
]

{ #category : #accessing }
GsOverlay >> onDragStart: aBlock [
  onDragStart := aBlock
]

{ #category : #initialization }
GsOverlay >> onMouseMove: aBlock [
  onMouseMove := aBlock
]

{ #category : #accessing }
GsOverlay >> resetFlags [
  mouseDown := false.
  mouseMoved := false.
  dragging := false.
]
