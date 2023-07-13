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
GsTrackModel >> valueAtFrame: aNumber [
  ^ cache at: (aNumber beBetween: 1 and: cache size)
]
