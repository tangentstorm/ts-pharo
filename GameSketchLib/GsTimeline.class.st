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
  cursor := self makeCursor.   
  timeline := GsGridUi new.
  scrollPane := self makeScrollPane.
  trackList := self makeTrackList.
  self addChild: self makeUi as: #ui.
  self matchParent
]

{ #category : #initialization }
GsTimeline >> makeCursor [
 ^ BlElement new size: 8@16;
   background: Color veryLightGray;
   border: Color black.
]

{ #category : #initialization }
GsTimeline >> makeScrollPane [
  ^ BrScrollPane new
    border: (Color darkGray);
    aptitude: BrScrollPaneAptitude
      + BrGlamorousWithHorizontalScrollbarAptitude;
    content: timeline.
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
GsTimeline >> makeUi [
  ^ BrHorizontalPane new
    vExact: 100;
    hMatchParent;
      addChildren: {
      BrVerticalPane new 
        addChild: (BlElement new size: 10@10);
        addChild: trackList;
        fitContent.
      scrollPane}
]
