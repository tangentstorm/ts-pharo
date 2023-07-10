Class {
	#name : #GsTimeline,
	#superclass : #GsObject,
	#instVars : [
		'grid',
		'scrollPane',
		'trackList',
		'timeline',
		'cursor'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #initialization }
GsTimeline >> initialize [
  super initialize.
  timeline := GsGridUi new.
  scrollPane := self makeScrollPane.
  trackList := self makeTrackList.
  self addChild: self makeUi as: #ui.
  self matchParent
]

{ #category : #initialization }
GsTimeline >> makeCursor [
  |a cw ch|
  a := 0.5.
  cw := 20.
  ch := 16.
  cursor := BlElement new size: cw@ch;
    background: (Color veryLightGray alpha: a);
    border: (Color black alpha: a);
    clipChildren: false;
    relocate: 0@0;
    addChild: (BlElement new
      size: 1@65536;
      relocate: (cw/2)@ch;
      border: (Color black alpha: a)) as: #tail;
    addEventHandler: (BlPullHandler new disallowOutOfBounds beHorizontal);
    when: BlPullEndEvent do: [ "snap to closest frame"
      cursor relocate:
        (cw * (cursor position x + (cw//2) // cw) asInteger)@0].
  ^ cursor
]

{ #category : #initialization }
GsTimeline >> makeScrollPane [
  ^ BrScrollPane new
    border: (Color darkGray);
    aptitude: BrScrollPaneAptitude
      + BrGlamorousWithHorizontalScrollbarAptitude;
    content: timeline
]

{ #category : #accessing }
GsTimeline >> makeScrollPaneHolder [
  ^ BrWidgetContainer new
    addChild: scrollPane;
    addChild: self makeCursor as: #cursor;
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
   addChild: trackList;
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
