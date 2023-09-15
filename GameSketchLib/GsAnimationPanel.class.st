Class {
	#name : #GsAnimationPanel,
	#superclass : #GsDockable,
	#instVars : [
		'timeline',
		'frameCounter',
		'playButton',
		'sketch',
		'animationList',
		'addAnimationButton',
		'addTrackWidget'
	],
	#category : #'GameSketchLib-UI - Panels'
}

{ #category : #accessing }
GsAnimationPanel >> animation [
  ^ self timeline animation
]

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
    when: GsPlayheadMovedEvent do: [ :e|
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
    addChild: (box := GsField new text: 'id prop') as: #field;
    addChild: (GsButton accept action: [
      | pair|
      pair := (box text asString splitOn: ' ') collect: #asSymbol.
      pair size = 2 ifTrue: [
        box border: Color veryDarkGray.
        self animation addTrackFor: pair withKeys: {}]
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

{ #category : #accessing }
GsAnimationPanel >> selection: aSelection [
  super selection: aSelection.
  selection whenChangedDo:  [:e|
    selection ifNotEmpty: [
      selection first id ifNotNil: [:id|
        (addTrackWidget childNamed: #field)
          text: id asSymbol asString, ' position']]]
]

{ #category : #ui }
GsAnimationPanel >> sketch: aSketch [
  sketch := aSketch.
  timeline animation: aSketch currentAnimation
]

{ #category : #initialization }
GsAnimationPanel >> timeline [
  ^ timeline
]
