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
  timeline when: GsFrameChangedEvent do: [ :e | 
    frameCounter text: ('frame: ', e frame asString) asRopedText ].
  ^ ui
]

{ #category : #accessing }
GsAnimator >> stageSize [
  ^ 640@480
]
