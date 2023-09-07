"
I hold an ordered list of keyframes for a particular property in a {{gtClass:GsTimeline}} animation.
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
		'valueClass'
	],
	#category : #'GameSketchLib-Animation'
}

{ #category : #initialization }
GsAnimationTrack class >> for: aNameAndProperty withKeys: aCollection [
  ^ self basicNew for: aNameAndProperty withKeys: aCollection
]

{ #category : #accessing }
GsAnimationTrack >> buildCache [
  |frames runs prev|
  frames := keyFrames keys.
  frames first ~= 0 ifTrue: [ frames error: 'must have key for frame 0' ].
  runs := OrderedCollection new.
  prev := 0.
  frames allButFirstDo: [:x| runs add: x - prev. prev := x].
  runs add: 1. "(we'll clamp to this number of frames)"
  cache := RunArray runs: runs values: keyFrames values.
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
    label: 'Element name';
    accessor: #elementName
]

{ #category : #accessing }
GsAnimationTrack >> for: aNameAndProperty withKeys: aCollection [
  elementName := aNameAndProperty  first.
  propertyName := aNameAndProperty second.
  keyFrames := aCollection asOrderedDictionary.
  self buildCache.
]

{ #category : #accessing }
GsAnimationTrack >> initialize [
  super initialize.
  valueClass := #Object
]

{ #category : #accessing }
GsAnimationTrack >> keyFrames [
	^ keyFrames
]

{ #category : #accessing }
GsAnimationTrack >> name [
  ^ elementName, '.', propertyName
]

{ #category : #magritte }
GsAnimationTrack >> propertyName [
	^ propertyName
]

{ #category : #accessing }
GsAnimationTrack >> propertyName: anObject [
	^ propertyName := anObject
]

{ #category : #accessing }
GsAnimationTrack >> propertyNameDescription [
  <magritteDescription>
  ^ MASymbolDescription new
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

{ #category : #accessing }
GsAnimationTrack >> valueClassDescription [
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Value Class';
    accessor: #valueClass
]
