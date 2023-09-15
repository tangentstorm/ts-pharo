"
I provide a visual timeline for placing keyframes for animations.
"
Class {
	#name : #GsTimelineElement,
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
		'animation',
		'trackElements'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsTimelineElement >> addTrackElementFor: aTrack [
  | el| 
  el := GsTrackElement new track: aTrack.
  trackElements add: el.
  grid addChild: (el relocate: 0@(16 * trackElements size)).
]

{ #category : #accessing }
GsTimelineElement >> addTrackFor: aNameAndProperty withKeys: aCollection [
  | track |
  track := animation
    addTrackFor: aNameAndProperty withKeys: aCollection.
  trackList items: animation trackNames.
  self addTrackElementFor: track
]

{ #category : #accessing }
GsTimelineElement >> animation: anAnimation [
  animation := anAnimation.
  trackList items: animation trackNames.
  self rebuildTracks.
  currentFrame := -1. "force event to fire."
  self gotoFrame: 0.
]

{ #category : #events }
GsTimelineElement >> checkFrameChange [
  self gotoFrame: self frameFromPlayhead.
]

{ #category : #accessing }
GsTimelineElement >> colW [
	^ colW
]

{ #category : #accessing }
GsTimelineElement >> frameFromPlayhead [
	| offset |
	offset := scrollPane children first scrollPosition negated x.
	^ playhead position x + offset + (colW//2) // colW asInteger
]

{ #category : #events }
GsTimelineElement >> gotoFrame: frame [
  frame ~= currentFrame ifTrue: [
    animation gotoFrame: frame.
    self fireEvent: (
      GsPlayheadMovedEvent new 
        old: currentFrame
        new: frame).
    currentFrame := frame]
]

{ #category : #initialization }
GsTimelineElement >> initialize [
  trackElements := OrderedCollection new.
  super initialize.
  activeZone := 50.
  dxScroll := 0.
  curH := 16.
  colW := 20.
  animation := GsAnimation new.
  scrollPane := self makeScrollPane.
  currentFrame := 0.
  self addChild: self makeUi as: #ui.
  self matchParent.
]

{ #category : #initialization }
GsTimelineElement >> makeGrid [
   ^ grid := GsGridUi new
     addChild: (GsObject new
       border: (Color darkGray);
       vExact: 1; hMatchParent;
       relocate: 0@16)
]

{ #category : #initialization }
GsTimelineElement >> makePlayhead [
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
GsTimelineElement >> makeScrollPane [
  ^ BrScrollPane new
    border: (Color darkGray);
    aptitude: BrScrollPaneAptitude
      + BrGlamorousWithHorizontalScrollbarAptitude;
    content: self makeGrid
]

{ #category : #initialization }
GsTimelineElement >> makeScrollPaneHolder [
  ^ BrWidgetContainer new
    addChild: scrollPane as: #scrollPane;
    addChild: self makePlayhead as: #playhead;
    matchParent
]

{ #category : #initialization }
GsTimelineElement >> makeTrackList [
  ^ trackList := BrSimpleList vertical
    hExact: 100; vMatchParent;
    itemType: [:aFactory :anItem :anIndex | String];
    itemStencil: [:anItem|
      BrLabel new aptitude: BrGlamorousLabelAptitude];
    itemDataBinder: [ :anElement :anItem :anIndex |
      anElement text: anItem asString ].
]

{ #category : #initialization }
GsTimelineElement >> makeTrackListHolder [
  ^ BrVerticalPane new 
    addChild: (BlElement new size: 16@16);
    addChild: self makeTrackList as: #trackList;
    hFitContent;
    vMatchParent
]

{ #category : #initialization }
GsTimelineElement >> makeUi [
  ^ BrHorizontalPane new
    vExact: 100;
    hMatchParent;
      addChildren: {
        self makeTrackListHolder.
        self makeScrollPaneHolder.}
]

{ #category : #events }
GsTimelineElement >> onPlayheadPull [
  "auto-scroll when cursor is dragged towards edge"
  dxScroll := 0.
  autoScrollTask
    ifNil: [ autoScrollTask := BlRepeatedTaskAction new delay: 10 milliseconds]
    ifNotNil: #stop.
  (playhead parent extent x - (playhead position x)) < activeZone
      ifTrue: [ dxScroll := 0.25].
  playhead position x < activeZone
      ifTrue: [ dxScroll := -0.25].
  dxScroll ~= 0 ifTrue: [
    autoScrollTask action: [
      scrollPane scrollBy: (colW * dxScroll)@0.
      self checkFrameChange].
    ([scrollPane enqueueTask: autoScrollTask ] ifErrorDo: []) value].
  self checkFrameChange.
]

{ #category : #events }
GsTimelineElement >> onPlayheadPullEnd [
  "snap cursor and scrollPane to a column (frame) boundary"
  autoScrollTask ifNotNil: #stop.
  playhead relocate: (self snapToColumn: playhead position).
  self snapScrollpane.
]

{ #category : #accessing }
GsTimelineElement >> rebuildTracks [
  trackElements do: [:o| o removeFromParent].
  trackElements := OrderedCollection new.
  animation tracksDo: [:track |
    self addTrackElementFor: track]
]

{ #category : #snapping }
GsTimelineElement >> snapScrollpane [
  |sp sc xy0 xy1|  
  sp := self childNamed: #scrollPane.
  sc := (sp childNamed: #scrollable).
  xy0 := sc scrollPosition.
  xy1 :=  self snapToColumn: xy0 .
  sc scrollBy: xy1 - xy0.  
]

{ #category : #snapping }
GsTimelineElement >> snapToColumn: aPoint [
  ^ (colW * (aPoint x + (colW//2) // colW) asInteger) @ aPoint y
]
