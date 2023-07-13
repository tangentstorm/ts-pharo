"
I provide a visual timeline for placing keyframes for animations.
"
Class {
	#name : #GsTimeline,
	#superclass : #GsObject,
	#instVars : [
		'scrollPane',
		'trackList',
		'activeZone',
		'dxScroll',
		'autoScrollTask',
		'curH',
		'colW',
		'playhead',
		'grid',
		'currentFrame',
		'viewModel'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsTimeline >> addTrackFor: aNameAndProperty withKeys: aCollection [
  viewModel addTrackFor: aNameAndProperty withKeys: aCollection.
  trackList items: viewModel trackNames.
  grid addChild: (GsAnimationTrack new
    addFrames: aCollection;
    relocate: 0@ (20 * (viewModel trackCount - 1) + 16))
]

{ #category : #events }
GsTimeline >> checkFrameChange [
  |frame|
  frame := self frameFromPlayhead.
  frame ~= currentFrame ifTrue: [
    self fireEvent: (GsFrameChangedEvent new frame: frame)]

]

{ #category : #accessing }
GsTimeline >> colW [
	^ colW
]

{ #category : #accessing }
GsTimeline >> frameFromPlayhead [
	| offset |
	offset := scrollPane children first scrollPosition negated x.
	^ playhead position x + offset + (colW//2) // colW asInteger
]

{ #category : #initialization }
GsTimeline >> initialize [
  super initialize.
  activeZone := 50.
  dxScroll := 0.
  curH := 16.
  colW := 20.
  viewModel := GsTimelineModel new.
  scrollPane := self makeScrollPane.
  currentFrame := 0.
  self addChild: self makeUi as: #ui.
  self matchParent.
]

{ #category : #initialization }
GsTimeline >> makeGrid [
   ^ grid := GsGridUi new
     addChild: (GsObject new
       border: (Color darkGray);
       vExact: 1; hMatchParent;
       relocate: 0@16)
]

{ #category : #initialization }
GsTimeline >> makePlayhead [
  |alpha |
  alpha := 0.5.
  playhead := BlElement new size: colW@curH;
    background: (Color veryLightGray alpha: alpha);
    border: (Color black alpha: alpha);
    clipChildren: false;
    relocate: 0@0;
    addChild: (BlElement new
      size: 1@65536;
      relocate: (colW/2)@curH;
      border: (Color black alpha: alpha)) as: #tail;
    addEventHandler: (BlPullHandler new disallowOutOfBounds beHorizontal);
    when: BlPullEvent do: [self onPlayheadPull];
    when: BlPullEndEvent do: [ self onPlayheadPullEnd ].
  ^ playhead
]

{ #category : #initialization }
GsTimeline >> makeScrollPane [
  ^ BrScrollPane new
    border: (Color darkGray);
    aptitude: BrScrollPaneAptitude
      "+ BrGlamorousWithHorizontalScrollbarAptitude";
    content: self makeGrid
]

{ #category : #initialization }
GsTimeline >> makeScrollPaneHolder [
  ^ BrWidgetContainer new
    addChild: scrollPane as: #scrollPane;
    addChild: self makePlayhead as: #playhead;
    matchParent
]

{ #category : #initialization }
GsTimeline >> makeTrackList [
  ^ trackList := BrSimpleList vertical
    hExact: 100;
    itemType: [:aFactory :anItem :anIndex | String];
    itemStencil: [:anItem|
      BrLabel new aptitude: BrGlamorousLabelAptitude];
    itemDataBinder: [ :anElement :anItem :anIndex |
      anElement text: anItem asString ].
]

{ #category : #initialization }
GsTimeline >> makeTrackListHolder [
  ^ BrVerticalPane new 
    addChild: (BlElement new size: 16@16);
    addChild: self makeTrackList as: #trackList;
    fitContent
]

{ #category : #initialization }
GsTimeline >> makeUi [
  ^ BrHorizontalPane new
    vExact: 100;
    hMatchParent;
      addChildren: {
        self makeTrackListHolder.
        self makeScrollPaneHolder.}
]

{ #category : #events }
GsTimeline >> onPlayheadPull [
  "auto-scroll when cursor is dragged towards edge"
  dxScroll := 0.
  autoScrollTask
    ifNil: [ autoScrollTask := BlRepeatedTaskAction new delay: 10 milliseconds]
    ifNotNil: #stop.
  (playhead parent extent x - (playhead position x)) < activeZone
      ifTrue: [ dxScroll := -0.25].
  playhead position x < activeZone
      ifTrue: [ dxScroll := 0.25].
  dxScroll ~= 0 ifTrue: [
    autoScrollTask action: [
      scrollPane scrollBy: (colW * dxScroll)@0.
      self checkFrameChange].
    ([scrollPane enqueueTask: autoScrollTask ] ifErrorDo: []) value].
  self checkFrameChange.
]

{ #category : #events }
GsTimeline >> onPlayheadPullEnd [
  "snap cursor and scrollPane to a column (frame) boundary"
  autoScrollTask ifNotNil: #stop.
  playhead relocate: (self snapToColumn: playhead position).
  self snapScrollpane.
]

{ #category : #snapping }
GsTimeline >> snapScrollpane [
  |sp sc xy0 xy1|  
  sp := self childNamed: #scrollPane.
  sc := (sp childNamed: #scrollable).
  xy0 := sc scrollPosition.
  xy1 :=  self snapToColumn: xy0 .
  sc scrollBy: xy1 - xy0.  
]

{ #category : #snapping }
GsTimeline >> snapToColumn: aPoint [
  ^ (colW * (aPoint x + (colW//2) // colW) asInteger) @ aPoint y
]

{ #category : #accessing }
GsTimeline >> viewModel [
  ^ viewModel
]
