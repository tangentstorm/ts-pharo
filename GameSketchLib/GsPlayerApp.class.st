"
I bind a {{gtClass:GsTimelineElement}}  to a {{gtClass:GsScene}} and update the scene when the timeline's playhead moves to a new frame.

"
Class {
	#name : #GsPlayerApp,
	#superclass : #GsToolApp,
	#instVars : [
		'timeline',
		'frameCounter',
		'trackSetters',
		'animationPanel'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsPlayerApp >> addTrackFor: aNameAndProperty withKeys: aCollection [ 
  timeline addTrackFor: aNameAndProperty withKeys: aCollection 
]

{ #category : #events }
GsPlayerApp >> frameChanged: anEvent [
  | frame propValues |
  frame := anEvent  frame.
  frameCounter text: ('frame: ', frame asString) asRopedText.
  propValues := (timeline viewModel valuesForFrame: frame)
    readStream.
  self trackSetters do: [:setter| setter set: propValues next].
]

{ #category : #initialization }
GsPlayerApp >> makeAnimationPanel [
  animationPanel := GsAnimationPanel new.
  timeline := animationPanel timeline .
  timeline when: GsFrameChangedEvent do: [ :e| self frameChanged: e].
  ^ animationPanel
]

{ #category : #initialization }
GsPlayerApp >> makeFrameCounter [
  ^ frameCounter := BlTextElement new 
    padding: (BlInsets all: 5);
    text: 'frame: 0' asRopedText.
]

{ #category : #initialization }
GsPlayerApp >> makeTimeline [
  ^ timeline := GsTimelineElement new hMatchParent vExact: 120
]

{ #category : #initialization }
GsPlayerApp >> makeToolbar [
  ^ BrHorizontalPane new hMatchParent vFitContent
     addChild: super makeToolbar;
     addChild:  self makeFrameCounter.
]

{ #category : #initialization }
GsPlayerApp >> makeUI [
  ui := super makeUI.
  dockHolder
    addDockable: self makeAnimationPanel as: #animation in: #bottomDock.
  ^ ui
]

{ #category : #accessing }
GsPlayerApp >> timeline [
  ^ timeline
]

{ #category : #accessing }
GsPlayerApp >> trackSetters [
  "return a GsSetter for each track in the timeline, bound to a specific property on an element in the scene"
   ^ timeline viewModel trackSymbols
     collect: [:nameAndProp|
       |elementName propName|
       elementName := nameAndProp first.
       propName := nameAndProp second.
       GsProp for: propName on: (scene childNamed: elementName)]
  
]
