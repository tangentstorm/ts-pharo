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
		'sketch',
		'valDescription',
		'typeName'
	],
	#category : #'GameSketchLib-Animation'
}

{ #category : #creating }
GsAnimationTrack class >> for: sketch at: n prop: p keys: aCollection [
  ^ self new for: sketch at: n prop: p keys: aCollection
]

{ #category : #accessing }
GsAnimationTrack class >> fromData: aDict [
  | res type | type := aDict at: #type.
  res := self new.
  
  ^ res
]

{ #category : #accessing }
GsAnimationTrack >> asData [
  "returns a list of [int, str(value), str(easingSymbol)] triples"
  ^ { #el -> self elementName asString.
      #prop -> self propertyName asString.
      #type -> self typeName asString.
      #keys -> (keyFrames sortKeys associations collect: [:kv|
        { kv key. kv value first asString. kv value second asString. }]) asArray
    } asOrderedDictionary.
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
  self withoutKeysfor: aSketch at: aChildName prop: aPropName.
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

{ #category : #accessing }
GsAnimationTrack >> fromData: aDict [
  "inverse of asData"
  | type| type := (aDict at: #type) asClass.
  self elementName: (aDict at: #el).
  self propertyName: (aDict at: #prop).
  (aDict at: #keys) do: [:keyData|
    self at: (keyData at: #key)
        put: (type readFrom: (keyData at: #value))
        easing: (keyData at: #easing)].
]

{ #category : #magritte }
GsAnimationTrack >> keyframeData [
  "helper for magritte"
  |res| res := OrderedCollection new.
  keyFrames sortKeys.
  self framesDo: [:k :v :e|
    res add: (
      GsKeyframeData new
        key: k; val: v; easing: e;
        valDescription: self valDescription) ].
  ^ res
]

{ #category : #accessing }
GsAnimationTrack >> keyframes [
  ^ keyFrames
]

{ #category : #accessing }
GsAnimationTrack >> keyframesDescription [
  <magritteDescription>
  ^ MAToManyRelationDescription new
    label: 'Keyframes';
    accessor: #keyframeData
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
GsAnimationTrack >> typeName [
	^ typeName
]

{ #category : #accessing }
GsAnimationTrack >> typeName: aSymbol [
	typeName := aSymbol
]

{ #category : #magritte }
GsAnimationTrack >> valDescription [
  "this builds a magritte description to be shared by all the keyframeData objects in this track."
  ^ valDescription ifNil: [|c d|
      d := {
        #position -> GsPointDescription.
        #bottomRight -> GsPointDescription.
        #rotation -> MANumberDescription.
        #fillColor -> MAColorDescription.
        #lengthShown -> MANumberDescription.
      } asDictionary.
      c := d at: self propertyName
             ifAbsent: MANumberDescription.
      valDescription := c new
        label: 'val';
        accessor: #val ]
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

{ #category : #initialization }
GsAnimationTrack >> withoutKeysfor: aSketch at: aChildName prop: aPropName [ 
  sketch := aSketch.
  elementName := aChildName.
  propertyName := aPropName.
  keyFrames := OrderedDictionary new.
]
