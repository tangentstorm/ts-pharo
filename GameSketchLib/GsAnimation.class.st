"
I contain a {{gtClass:GsAnimationTrack}} for each ({{gtClass:GsObject}}, property) pair to be animated.

I am displayed by a {{gtClass:GsAnimator}}. When its playhead moves to a new frame, I return a list of closures - one per track - that the animator calls to update the actual scene elements.

"
Class {
	#name : #GsAnimation,
	#superclass : #Object,
	#instVars : [
		'trackData'
	],
	#category : #'GameSketchLib-Animation'
}

{ #category : #accessing }
GsAnimation >> addTrackFor: aNameAndProperty withKeys: aCollection [
  |track|  
  track := (GsAnimationTrack new for: aNameAndProperty withKeys: aCollection).
  trackData at: track name put: track
  
]

{ #category : #inspecting }
GsAnimation >> gtTreeFor: aView [
  <gtView>
	^ aView columnedTree
		title: 'Tree';
		priority: 100;
		items: [ trackData values ];
		children: [ :aNode | 
		  (aNode isKindOf: GsAnimationTrack)
		  ifTrue: [aNode keyFrames associations]
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
  trackData := OrderedDictionary new.
]

{ #category : #accessing }
GsAnimation >> trackCount [
  ^ trackData size
]

{ #category : #accessing }
GsAnimation >> trackData [
  ^ trackData
]

{ #category : #accessing }
GsAnimation >> trackNames [
  ^ trackData keys
]

{ #category : #accessing }
GsAnimation >> trackSymbols [
  "the element name and property name for each track, as symbols"
  ^ trackData values  collect: [:x| {x elementName. x propertyName.}]
]

{ #category : #accessing }
GsAnimation >> valuesForFrame: aNumber [
  ^ trackData values collect: [:track | track valueAtFrame: aNumber+1]
]
