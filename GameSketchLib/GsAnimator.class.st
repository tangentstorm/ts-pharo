"
I bind a {{gtClass:GsTimelineElement}}  to a {{gtClass:GsScene}} and update the scene when the timeline's playhead moves to a new frame.

"
Class {
	#name : #GsAnimator,
	#superclass : #GsToolApp,
	#instVars : [
		'timeline',
		'frameCounter',
		'trackSetters'
	],
	#category : #'GameSketchLib-Apps'
}

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
GsAnimator >> makeTimeline [
  ^ timeline := GsTimelineElement new hMatchParent vExact: 120
]

{ #category : #initialization }
GsAnimator >> makeToolbar [
  ^ BrHorizontalPane new hMatchParent vFitContent
     addChild: super makeToolbar;
     addChild:  self makeFrameCounter.
]

{ #category : #initialization }
GsAnimator >> makeUI [
  ui := super makeUI addChild: self makeTimeline as: #timeline.
  timeline when: GsFrameChangedEvent do: [ :e| self frameChanged: e].
  ^ ui
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
       GsProp for: propName on: (scene childNamed: elementName)]
  
]
