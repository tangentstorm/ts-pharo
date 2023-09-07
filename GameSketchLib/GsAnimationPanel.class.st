Class {
	#name : #GsAnimationPanel,
	#superclass : #GsDockable,
	#instVars : [
		'timeline',
		'frameCounter',
		'playButton',
		'selection',
		'sketch'
	],
	#category : #'GameSketchLib-UI - Panels'
}

{ #category : #accessing }
GsAnimationPanel >> beDocked [
  super beDocked.
  self hMatchParent vExact: 120
]

{ #category : #accessing }
GsAnimationPanel >> beUndocked [
  super beUndocked.
  self hExact: 100.
]

{ #category : #accessing }
GsAnimationPanel >> frameChanged: anEvent [
  | frame | frame := anEvent frame.
  frameCounter text:
    ('frame: ',frame asString) asRopedText.
]

{ #category : #accessing }
GsAnimationPanel >> initialize [
  super initialize title: 'Animation'; hExact: 200.  
  workArea addChild: (timeline := GsTimelineElement new
    when: GsFrameChangedEvent do: [ :e|
      self frameChanged: e]).
]

{ #category : #accessing }
GsAnimationPanel >> makeFrameCounter [
  ^ frameCounter := BrLabel new 
    aptitude: BrGlamorousLabelAptitude;
    alignCenterLeft;
    hExact: 60;
    text: 'frame: 0'.
]

{ #category : #accessing }
GsAnimationPanel >> makeTitleBar [
  super makeTitleBar.
  titleBar
     addChild: (BlElement new
       constraintsDo: [:c|
         c vertical exact: 0.
         c horizontal matchParent]);
     addChild: self makeFrameCounter.
  ^ titleBar
]

{ #category : #ui }
GsAnimationPanel >> selection: aSelection [
  selection := aSelection
]

{ #category : #ui }
GsAnimationPanel >> sketch: aSketch [
  sketch := aSketch
]

{ #category : #initialization }
GsAnimationPanel >> timeline [
  ^ timeline
]
