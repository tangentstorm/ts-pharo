"
I bind a {{gtClass:GsTimeline}}  to a {{gtClass:GsScene}} and update the scene when the timeline's playhead moves to a new frame.

"
Class {
	#name : #GsAnimator,
	#superclass : #GsApp,
	#instVars : [
		'stage',
		'timeline',
		'frameCounter'
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
  frameCounter text: ('frame: ', anEvent frame asString) asRopedText.
  
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
      background: GsColors defaultBg;
      addChild: self makeStage as: #stage;
      alignCenter
]

{ #category : #initialization }
GsAnimator >> makeStage [
 ^ stage := BlElement new
   size: self stageSize; 
   clipChildren: false;
   addChild: (scene clipChildren: false) as: #scene;
   addChild: (BlElement new
     size: self stageSize;
     border: Color black)
   as: #bounds

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
