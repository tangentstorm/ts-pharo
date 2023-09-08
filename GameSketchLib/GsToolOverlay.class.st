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
		'buttonTool',
		'gizmoLayer'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsToolOverlay class >> for: aScene [
  ^ self new scene: aScene
]

{ #category : #gizmos }
GsToolOverlay >> addGizmo: aGizmo [
  self addGizmos: {aGizmo}
]

{ #category : #gizmos }
GsToolOverlay >> addGizmos: aCollection [
  "gizmos are positioned relative to the scene's transformation. currently that's handled by  a child transformation, but always use this method just in case."
  gizmoLayer addChildren: aCollection
]

{ #category : #debugging }
GsToolOverlay >> drawCoords: aPoint [
  coords text: (aPoint rounded asString, ' ', 
    ((scene childAtPoint: aPoint) ifNil: ['']
       ifNotNil: #asString)) asRopedText
]

{ #category : #gizmos }
GsToolOverlay >> gizmoTransformDo: aBlock [
  gizmoLayer childrenTransformDo: aBlock
]

{ #category : #gizmos }
GsToolOverlay >> gizmoTransformation [
  ^ gizmoLayer childrenTransformation
]

{ #category : #gizmos }
GsToolOverlay >> gizmoTransformation: aTransformation [
  gizmoLayer childrenTransformation: aTransformation
]

{ #category : #initialization }
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
    addChild: self makeCoords as: #coords;
    addChild: self makeGizmoLayer as: #gizmoLayer;
    when: BlMouseDownEvent do: self onMouseDown;
    when: BlMouseMoveEvent do: self onMouseMove;
    when: BlMouseUpEvent do: self onMouseUp;
    when: BlMouseWheelEvent do: self onMouseWheel .
]

{ #category : #initialization }
GsToolOverlay >> makeCoords [
  ^ coords := BlTextElement new
    text:'' asRopedText;
    relocate: 5@5.
]

{ #category : #initialization }
GsToolOverlay >> makeGizmoLayer [
  ^ gizmoLayer := GsGizmoLayer new
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
GsToolOverlay >> onMouseDown [
  ^ [:e| |b|
      e consumed: true.  b := e button.
      dragging at: b put: false.
      startPoint at: b put: (
      self pointInScene: e localPosition).
      mouseDown at: b put: true]
]

{ #category : #initialization }
GsToolOverlay >> onMouseMove [
  ^ [:e| |p|
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
        ifFalse: [ tool move: p]]]
]

{ #category : #initialization }
GsToolOverlay >> onMouseUp [
  ^ [:e| |b p|
      e consumed: true.  b := e button.
      p := self pointInScene: e localPosition.
      mouseDown at: b put: false.
      (dragging at: b) ifTrue: [
        dragging at: b put: false.
        (buttonTool at: b) dragStop: p ]
      ifFalse: [ (buttonTool at: b) click: p ]]
]

{ #category : #initialization }
GsToolOverlay >> onMouseWheel [
  "the wheel is not button specific, so just tell everybody"
  ^ [:e|
       buttonTool detect: #wantsWheel
         ifOne: [:tool |
           tool mouseWheel: e vector.
           e consumed: true]]
]

{ #category : #accessing }
GsToolOverlay >> pointInScene: aPoint [
  ^ gizmoLayer localPointToChildren: aPoint
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
  self error: 'Use #removeGizmos instead.'
]

{ #category : #gizmos }
GsToolOverlay >> removeGizmos [
  gizmoLayer removeChildren.
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
