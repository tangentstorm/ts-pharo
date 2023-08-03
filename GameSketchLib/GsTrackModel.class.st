"
I hold an ordered list of keyframes for a particular property in a {{gtClass:GsTimeline}} animation.
From these, I generate a cached value for each frame of the animation.

I am displayed by  {{gtClass:GsAnimationTrack}}

"
Class {
	#name : #GsTrackModel,
	#superclass : #Object,
	#instVars : [
		'elementName',
		'propertyName',
		'keyFrames',
		'cache'
	],
	#category : #'GameSketchLib-UI - Models'
}

{ #category : #initialization }
GsTrackModel class >> for: aNameAndProperty withKeys: aCollection [
  ^ self basicNew for: aNameAndProperty withKeys: aCollection
]

{ #category : #accessing }
GsTrackModel >> buildCache [
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
GsTrackModel >> elementName [
	^ elementName
]

{ #category : #accessing }
GsTrackModel >> elementName: anObject [
	elementName := anObject
]

{ #category : #accessing }
GsTrackModel >> for: aNameAndProperty withKeys: aCollection [
  elementName := aNameAndProperty  first.
  propertyName := aNameAndProperty second.
  keyFrames := aCollection asOrderedDictionary.
  self buildCache.
]

{ #category : #accessing }
GsTrackModel >> initialize [
  super initialize.
  elementName := propertyName := '??'.
  
]

{ #category : #accessing }
GsTrackModel >> keyFrames [
	^ keyFrames
]

{ #category : #accessing }
GsTrackModel >> name [
  ^ elementName, '.', propertyName
]

{ #category : #accessing }
GsTrackModel >> propertyName [
	^ propertyName
]

{ #category : #accessing }
GsTrackModel >> propertyName: anObject [
	^ propertyName := anObject
]

{ #category : #accessing }
GsTrackModel >> valueAtFrame: aNumber [
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
