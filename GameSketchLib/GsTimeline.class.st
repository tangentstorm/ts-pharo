Class {
	#name : #GsTimeline,
	#superclass : #GsObject,
	#instVars : [
		'grid',
		'scrollPane',
		'trackList',
		'timeline',
		'activeZone',
		'dxScroll',
		'autoScrollTask',
		'curH',
		'colW',
		'playhead'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #initialization }
GsTimeline >> initialize [
  super initialize.
  activeZone := 50.
  dxScroll := 0.
  curH := 16.
  colW := 20.
  timeline := GsGridUi new.
  scrollPane := self makeScrollPane.
  trackList := self makeTrackList.
  self addChild: self makeUi as: #ui.
  self matchParent.
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
    content: timeline
]

{ #category : #accessing }
GsTimeline >> makeScrollPaneHolder [
  ^ BrWidgetContainer new
    addChild: scrollPane as: #scrollPane;
    addChild: self makePlayhead as: #playhead;
    matchParent
]

{ #category : #initialization }
GsTimeline >> makeTrackList [
  ^ BrSimpleList vertical
    hExact: 100;
    itemType: [:aFactory :anItem :anIndex | String];
    itemStencil: [:anItem|
      BrLabel new aptitude: BrGlamorousLabelAptitude];
    itemDataBinder: [ :anElement :anItem :anIndex |
      anElement text: anItem asString ];
    items: {'one'. 'two'. 'three'}.
]

{ #category : #accessing }
GsTimeline >> makeTrackListHolder [
 ^ BrVerticalPane new 
   addChild: (BlElement new size: 10@10);
   addChild: trackList as: #trackList;
   fitContent
]

{ #category : #accessing }
GsTimeline >> makeUi [
  ^ BrHorizontalPane new
    vExact: 100;
    hMatchParent;
      addChildren: {
        self makeTrackListHolder.
        self makeScrollPaneHolder.}
]

{ #category : #initialization }
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
    autoScrollTask action: [scrollPane scrollBy: (colW * dxScroll)@0].
    ([scrollPane enqueueTask: autoScrollTask ] ifErrorDo: []) value]
]

{ #category : #initialization }
GsTimeline >> onPlayheadPullEnd [
  "snap cursor and scrollPane to a column (frame) boundary"
  autoScrollTask ifNotNil: #stop.
  playhead relocate: (self snapToColumn: playhead position).
  self snapScrollpane.
]

{ #category : #initialization }
GsTimeline >> snapScrollpane [
  |sp sc xy0 xy1|  
  sp := self childNamed: #scrollPane.
  sc := (sp childNamed: #scrollable).
  xy0 := sc scrollPosition.
  xy1 :=  self snapToColumn: xy0 .
  sc scrollBy: xy1 - xy0.  
]

{ #category : #initialization }
GsTimeline >> snapToColumn: aPoint [
  ^ (colW * (aPoint x + (colW//2) // colW) asInteger) @ aPoint y
]
