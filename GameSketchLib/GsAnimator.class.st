"
I bind a {{gtClass:GsTimeline}}  to a {{gtClass:GsScene}} and update the scene when the timeline's playhead moves to a new frame.

"
Class {
	#name : #GsAnimator,
	#superclass : #GsToolApp,
	#instVars : [
		'stage',
		'timeline',
		'frameCounter',
		'trackSetters'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsAnimator >> addSceneChild: anElement as: aSymbol [
  scene addChild: anElement as: aSymbol 
]

{ #category : #accessing }
GsAnimator >> addTrackFor: aNameAndProperty withKeys: aCollection [ 
  timeline addTrackFor: aNameAndProperty withKeys: aCollection 
]

{ #category : #events }
GsAnimator >> frameChanged: anEvent [
  | frame propValues |
  frame := anEvent  frame.
  frameCounter text: ('frame: ', frame asString) asRopedText.
  propValues := (timeline viewModel valuesForFrame: frame)
    readStream.
  self trackSetters do: [:setter| setter set: propValues next].
]

{ #category : #initialization }
GsAnimator >> makeFrameCounter [
  ^ frameCounter := BlTextElement new 
    padding: (BlInsets all: 5);
    text: 'frame: 0' asRopedText.
]

{ #category : #initialization }
GsAnimator >> makeSceneHolder [
  ^ sceneHolder :=
    BrHorizontalPane new matchParent
      background: GsColor defaultBg;
      addChild: self makeStage as: #stage;
      alignCenter
]

{ #category : #initialization }
GsAnimator >> makeStage [
 ^ stage := BlElement new
   size: self stageSize; 
   clipChildren: false;
   addChild: (BlElement new
     size: self stageSize;
     border: Color black)
   as: #bounds;
   addChild: (scene clipChildren: false) as: #scene

]

{ #category : #initialization }
GsAnimator >> makeTimeline [
  ^ timeline := GsTimeline new hMatchParent vExact: 120
]

{ #category : #initialization }
GsAnimator >> makeToolbar [
  ^ super makeToolbar
    addChild:  self makeFrameCounter.

]

{ #category : #initialization }
GsAnimator >> makeUI [
  ui := super makeUI addChild: self makeTimeline as: #timeline.
  timeline when: GsFrameChangedEvent do: [ :e| self frameChanged: e].
  ^ ui
]

{ #category : #accessing }
GsAnimator >> stageSize [
  ^ 640@480
]

{ #category : #accessing }
GsAnimator >> timeline [
  ^ timeline
]

{ #category : #accessing }
GsAnimator >> trackSetters [
  "return a GsSetter for each track in the timeline, bound to a specific property on an element in the scene"
   ^ timeline viewModel trackSymbols
     collect: [:nameAndProp|
       |elementName propName|
       elementName := nameAndProp first.
       propName := nameAndProp second.
       GsSetter for: propName on: (scene childNamed: elementName)]
  
]
