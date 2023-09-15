"
I hold an ordered list of keyframes for a particular property in a {{gtClass:GsAnimation}}.
From these, I generate a cached value for each frame of the animation.

I can be rendered by a  {{gtClass:GsTrackElement}}

"
Class {
	#name : #GsAnimationTrack,
	#superclass : #Object,
	#instVars : [
		'elementName',
		'propertyName',
		'keyFrames',
		'cache',
		'valueClass',
		'sketch'
	],
	#category : #'GameSketchLib-Animation'
}

{ #category : #creating }
GsAnimationTrack class >> for: sketch at: n prop: p keys: aCollection [
  ^ self basicNew initialize
    for: sketch at: n prop: p keys: aCollection
]

{ #category : #accessing }
GsAnimationTrack class >> new [
  self error: 'use for:at:prop:keys:'
]

{ #category : #accessing }
GsAnimationTrack >> at: k put: v [
  ^ self at: k put: v easing: #linear.
]

{ #category : #accessing }
GsAnimationTrack >> at: k put: v easing: e [
  keyFrames at: k put: { v. e }.
  self buildCache.
]

{ #category : #caching }
GsAnimationTrack >> buildCache [
  |frames runs prev|
  keyFrames sortKeys.
  frames := keyFrames keys.
  frames first ~= 0 ifTrue: [ frames error: 'must have key for frame 0' ].
  runs := OrderedCollection new.
  prev := 0.
  frames allButFirstDo: [:x| runs add: x - prev. prev := x].
  runs add: 1. "(we'll clamp to this number of frames)"
  cache := RunArray runs: runs values: keyFrames values.
]

{ #category : #initialization }
GsAnimationTrack >> currentValueFromSketch [
  ^ (GsProp for: propertyName on: (sketch childWithId: elementName)) get
]

{ #category : #accessing }
GsAnimationTrack >> elementName [
	^ elementName
]

{ #category : #accessing }
GsAnimationTrack >> elementName: anObject [
	elementName := anObject
]

{ #category : #magritte }
GsAnimationTrack >> elementNameDescription [
  <magritteDescription>
  ^ MASymbolDescription new
    priority: 10;
    label: 'Element name';
    accessor: #elementName
]

{ #category : #initialization }
GsAnimationTrack >> for: aSketch at: aChildName prop: aPropName keys: aCollection [
  sketch := aSketch.
  elementName := aChildName.
  propertyName := aPropName.
  keyFrames := aCollection asOrderedDictionary.
  keyFrames at: 0 ifAbsentPut: [
    {self currentValueFromSketch. #linear}].
  self buildCache.
]

{ #category : #accessing }
GsAnimationTrack >> framesDo: aBlock [
  "block takes key, val, transition"
  keyFrames associationsDo: [:kv|
    aBlock value: kv key value: kv value first value value: kv value second]
]

{ #category : #initialization }
GsAnimationTrack >> initialize [
  super initialize.
  valueClass := #Number
]

{ #category : #accessing }
GsAnimationTrack >> keyframes [
  ^ keyFrames
]

{ #category : #accessing }
GsAnimationTrack >> name [
  ^ elementName, '.', propertyName
]

{ #category : #accessing }
GsAnimationTrack >> propertyName [
	^ propertyName
]

{ #category : #accessing }
GsAnimationTrack >> propertyName: anObject [
	^ propertyName := anObject
]

{ #category : #magritte }
GsAnimationTrack >> propertyNameDescription [
  <magritteDescription>
  ^ MASymbolDescription new
    priority: 20;
    label: 'Property';
    accessor: #propertyName
]

{ #category : #accessing }
GsAnimationTrack >> valueAtFrame: aNumber [
  |ix|
  ix := (aNumber beBetween: 0 and: cache size).
  ^ cache at: ix setRunOffsetAndValue: [:run :offset :value |
    |thisKey|
    thisKey := value first.
    "the last keyframe never has interpolation."
    run = keyFrames size
      ifTrue: [^ thisKey]
      ifFalse: [|nextKey easing fraction|
        nextKey:= (keyFrames at: (keyFrames keyAtIndex: run+1)) first.
        easing := BlEasing perform: value second.
        fraction := easing interpolate: (offset / (cache runs at: run)).
        ^ NSNumberInterpolator new start: thisKey; stop: nextKey;
          interpolate: fraction]]
]

{ #category : #accessing }
GsAnimationTrack >> valueClass [
  ^ valueClass
]

{ #category : #accessing }
GsAnimationTrack >> valueClass: aClass [
  valueClass := aClass
]

{ #category : #magritte }
GsAnimationTrack >> valueClassDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    priority: 30;
    label: 'Value Class';
    options: #(Number Color Point);
    accessor: #valueClass
]
