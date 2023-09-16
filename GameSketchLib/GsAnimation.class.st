"
I contain a {{gtClass:GsAnimationTrack}} for each ({{gtClass:GsObject}}, property) pair to be animated.

My tracks and keyframes can be rendered with a {{gtClass:GsTimelineElement}}. When its playhead moves to a new frame, I return a list of closures - one per track - that the animator calls to update the actual scene elements.

"
Class {
	#name : #GsAnimation,
	#superclass : #BlAnimation,
	#instVars : [
		'sketch',
		'tracks'
	],
	#category : #'GameSketchLib-Animation'
}

{ #category : #accessing }
GsAnimation >> addTrackFor: aNameAndProperty withKeys: aCollection [
  |track n p|
  n := aNameAndProperty first.
  p := aNameAndProperty second.
  track := (GsAnimationTrack
    for: sketch at: n prop: p keys: aCollection).
  tracks at: track name put: track.
  self fireEvent: GsAnimationTracksChanged new.  
]

{ #category : #accessing }
GsAnimation >> animatedProps [
  ^ self trackSymbols collect: [:ep |
      GsProp for: ep second
        on: (sketch childNamed: ep first)]
]

{ #category : #accessing }
GsAnimation >> asElement [
  ^ sketch
]

{ #category : #animation }
GsAnimation >> gotoFrame: i [
  | values |
  values  := (self valuesForFrame: i) readStream.
  self animatedProps do: [:prop| prop set: values next]
]

{ #category : #'gt - inspector' }
GsAnimation >> gtLiveFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Live';
    stencil: [GsPlayerApp new scene: self sketch]
]

{ #category : #inspecting }
GsAnimation >> gtTreeFor: aView [
  <gtView>
	^ aView columnedTree
		title: 'Tree';
		priority: 100;
		items: [ tracks values ];
		children: [ :aNode | 
		  (aNode isKindOf: GsAnimationTrack)
		  ifTrue: [aNode keyframes associations]
		  ifFalse: [{}]];
		column: 'track / frame'  text: [:aNode|
		  ((aNode isKindOf: GsAnimationTrack)
		    ifTrue: [aNode name]
		    ifFalse: [aNode key]) gtDisplayText];
		column: 'value' text: [ :anAssoc | anAssoc value gtDisplayText ];
		send: #value;
		actionUpdateButton
]

{ #category : #accessing }
GsAnimation >> initialize [
  super initialize.
  tracks := OrderedDictionary new.
]

{ #category : #accessing }
GsAnimation >> sketch [
  ^ sketch
]

{ #category : #accessing }
GsAnimation >> sketch: aSketch [
  sketch := aSketch
]

{ #category : #accessing }
GsAnimation >> trackCount [
  ^ tracks size
]

{ #category : #accessing }
GsAnimation >> trackData [
  ^ tracks values asOrderedCollection
]

{ #category : #accessing }
GsAnimation >> trackNames [
  ^ tracks keys
]

{ #category : #accessing }
GsAnimation >> trackSymbols [
  "the element name and property name for each track, as symbols"
  ^ tracks values  collect: [:x| {x elementName. x propertyName.}]
]

{ #category : #accessing }
GsAnimation >> tracks [
  ^ tracks
]

{ #category : #accessing }
GsAnimation >> tracksDescription [
  <magritteDescription>
  ^ MAToManyRelationDescription new
      label: 'Tracks';
      accessor: #trackData
]

{ #category : #accessing }
GsAnimation >> tracksDo: aBlock [
  tracks values do: aBlock
]

{ #category : #accessing }
GsAnimation >> valuesForFrame: aNumber [
  ^ tracks values collect: [:track | track valueAtFrame: aNumber+1]
]
