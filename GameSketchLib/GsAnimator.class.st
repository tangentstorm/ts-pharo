Class {
	#name : #GsAnimator,
	#superclass : #GsApp,
	#instVars : [
		'stage',
		'timeline'
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

{ #category : #accessing }
GsAnimator >> makeSceneHolder [
  ^ sceneHolder :=
    BrHorizontalPane new matchParent
      background: GsColors defaultBg;
      addChild: self makeStage as: #stage;
      alignCenter
]

{ #category : #accessing }
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

{ #category : #accessing }
GsAnimator >> makeUI [
  ^ super makeUI
    addChild: (timeline := GsTimeline new hMatchParent vExact: 120)
    as: #timeline.
]

{ #category : #accessing }
GsAnimator >> stageSize [
  ^ 640@480
]
