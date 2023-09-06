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
		'startPoint',
		'coords',
		'buttonTool'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsToolOverlay class >> for: aScene [
  ^ self new scene: aScene
]

{ #category : #debugging }
GsToolOverlay >> drawCoords: aPoint [
  coords text: (aPoint rounded asString, ' ', 
    ((scene childAtPoint: aPoint) ifNil: ['']
       ifNotNil: #asString)) asRopedText
]

{ #category : #accessing }
GsToolOverlay >> initialize [
  super initialize.
  buttonTool := {
    BlMouseButton primary -> GsTool new.
    BlMouseButton secondary -> GsTool new.
    BlMouseButton middle -> GsTool new }
    asDictionary.
  mouseDown := buttonTool collect: [:b| false].
  dragging := buttonTool collect: [:b| false].
  startPoint := buttonTool collect: [:b| nil].

  self matchParent;
    addChild: self makeCoords;
    when: BlMouseDownEvent do: [:e| |b|
      e consumed: true.  b := e button.
      dragging at: b put: false.
      startPoint at: b put: (
        self pointInScene: e localPosition).
      mouseDown at: b put: true];
    when: BlMouseMoveEvent do: [:e| |p|
      e consumed: true.
      p:= self pointInScene: e localPosition.
      self drawCoords: p.
      mouseDown associationsDo: [:kv|
        | b tool |
        b := kv key. tool := buttonTool at: b.
        kv value ifTrue: [
          (dragging at: b) ifFalse: [
            dragging at: b put: true.
            tool dragStart: (startPoint  at: b) ].
          tool dragStep: p ]
        ifFalse: [ tool move: p]]];
    when: BlMouseUpEvent do: [:e| |b p|
      e consumed: true.  b := e button.
      p := self pointInScene: e localPosition.
      mouseDown at: b put: false.
      (dragging at: b) ifTrue: [
        dragging at: b put: false.
        (buttonTool at: b) dragStop: p ]
      ifFalse: [ (buttonTool at: b) click: p ]].
]

{ #category : #accessing }
GsToolOverlay >> makeCoords [
  ^ coords := BlTextElement new
    text:'' asRopedText;
    relocate: 5@5.
]

{ #category : #accessing }
GsToolOverlay >> middleTool [
  ^ buttonTool at: BlMouseButton middle
]

{ #category : #accessing }
GsToolOverlay >> middleTool: aTool [
  aTool overlay: self.
  ^ buttonTool at: BlMouseButton middle put: aTool
]

{ #category : #accessing }
GsToolOverlay >> pointInScene: aPoint [
  ^ aPoint - scene position
]

{ #category : #accessing }
GsToolOverlay >> primaryTool [
  ^ buttonTool at: BlMouseButton primary
]

{ #category : #accessing }
GsToolOverlay >> primaryTool: aTool [
  aTool overlay: self.
  ^ buttonTool at: BlMouseButton primary put: aTool
]

{ #category : #accessing }
GsToolOverlay >> removeChildren [
  super removeChildren.
  self addChild: coords
]

{ #category : #accessing }
GsToolOverlay >> scene: aScene [
  scene := aScene.
]

{ #category : #accessing }
GsToolOverlay >> secondaryTool [
  ^ buttonTool at: BlMouseButton secondary
]

{ #category : #accessing }
GsToolOverlay >> secondaryTool: aTool [
  aTool overlay: self.
  ^ buttonTool at: BlMouseButton secondary put: aTool
]

{ #category : #accessing }
GsToolOverlay >> tool [
  ^ self primaryTool
]

{ #category : #accessing }
GsToolOverlay >> tool: aTool [
  self primaryTool: aTool
]
