Class {
	#name : #GsAnimationPanel,
	#superclass : #GsDockable,
	#instVars : [
		'timeline',
		'frameCounter',
		'playButton',
		'selection',
		'sketch',
		'animationList',
		'addAnimationButton',
		'addTrackWidget'
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
GsAnimationPanel >> makeAddAnimationButton [
  ^ addAnimationButton := GsTextShape new text: '[+]'
]

{ #category : #accessing }
GsAnimationPanel >> makeAddTrackWidget [
  | box |
  ^ addTrackWidget := BrHorizontalPane new
    addChild: (GsLabel new text: 'add track:');
    addChild: (box := GsField new text: 'id prop');
    addChild: (GsButton accept action: [
      | pair|
      pair := (box text asString splitOn: ' ') collect: #asSymbol.
      pair size = 2 ifTrue: [
        box border: Color veryDarkGray.
        self halt. "this will fail if not a numeric property."
        timeline addTrackFor: pair withKeys: {
          0 -> {0. #linear}}]
      ifFalse:  [ box border: Color red]]);
    fitContent; transformDo: [:t | t scaleBy: 0.8]
]

{ #category : #accessing }
GsAnimationPanel >> makeAnimationList [
  ^ animationList := GsTextShape new text: '[animations]'
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
     addChild: (GsObject new vExact:0; hMatchParent);
     addChild: self makeAnimationList;
     addChild: self makeAddAnimationButton;
     addChild: (GsObject new vExact:0; hMatchParent);
     addChild: self makeAddTrackWidget;
     addChild: (GsObject new vExact:0; hMatchParent);
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
