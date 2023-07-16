Class {
	#name : #GsTimelineModel,
	#superclass : #Object,
	#instVars : [
		'trackData'
	],
	#category : #'GameSketchLib-UI - Models'
}

{ #category : #accessing }
GsTimelineModel >> addTrackFor: aNameAndProperty withKeys: aCollection [
  |track|  
  track := (GsTrackModel new for: aNameAndProperty withKeys: aCollection).
  trackData at: track name put: track
  
]

{ #category : #inspecting }
GsTimelineModel >> gtTreeFor: aView [
  <gtView>
	^ aView columnedTree
		title: 'Tree';
		priority: 100;
		items: [ trackData values ];
		children: [ :aNode | 
		  (aNode isKindOf: GsTrackModel)
		  ifTrue: [aNode keyFrames associations]
		  ifFalse: [{}]];
		column: 'track / frame'  text: [:aNode|
		  ((aNode isKindOf: GsTrackModel)
		    ifTrue: [aNode name]
		    ifFalse: [aNode key]) gtDisplayText];
		column: 'value' text: [ :anAssoc | anAssoc value gtDisplayText ];
		send: #value;
		actionUpdateButton
]

{ #category : #accessing }
GsTimelineModel >> initialize [
  super initialize.
  trackData := OrderedDictionary new.
]

{ #category : #accessing }
GsTimelineModel >> trackCount [
  ^ trackData size
]

{ #category : #accessing }
GsTimelineModel >> trackData [
  ^ trackData
]

{ #category : #accessing }
GsTimelineModel >> trackNames [
  ^ trackData keys
]

{ #category : #accessing }
GsTimelineModel >> trackSymbols [
  "the element name and property name for each track, as symbols"
  ^ trackData values  collect: [:x| {x elementName. x propertyName.}]
]

{ #category : #accessing }
GsTimelineModel >> valuesForFrame: aNumber [
  ^ trackData values collect: [:track | track valueAtFrame: aNumber+1]
]
