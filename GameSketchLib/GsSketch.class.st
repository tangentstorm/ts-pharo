"
I am a {{gtClass:GsGroup}} that  (in the future) can have attached scripts and be saved to disk. 
"
Class {
	#name : #GsSketch,
	#superclass : #GsShape,
	#instVars : [
		'animations',
		'currentAnimation',
		'lists',
		'idCounter'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsSketch class >> fromJSON: aString [ 
  "build a scene from a json string"
  ^ GsJsonReader new read: aString
]

{ #category : #accessing }
GsSketch >> add: aShape toList: aName [
  (lists at: aName ifAbsentPut: [GsList new])
    add: aShape
]

{ #category : #animations }
GsSketch >> addAnimation: x [
  self error:
    'GsSketch animations require names. use addAnimation:as: to provide one.'
]

{ #category : #animations }
GsSketch >> addAnimation: anAnimation as: aName [
  animations at: aName asSymbol put: (anAnimation sketch: self).
  super addAnimation: anAnimation.
  ^ anAnimation
]

{ #category : #animation }
GsSketch >> animatedProps [
  ^ currentAnimation animatedProps
]

{ #category : #animations }
GsSketch >> animationNamed: aSymbol [
  ^ animations at: aSymbol
]

{ #category : #animations }
GsSketch >> animationNames [
  ^ animations keys
]

{ #category : #accessing }
GsSketch >> animations [
  ^ animations
]

{ #category : #magritte }
GsSketch >> animationsData [
  ^ animations collect: [:o | o asData]
]

{ #category : #accessing }
GsSketch >> animationsData: aDictionary [
  animations := OrderedDictionary new.
  aDictionary associationsDo: [:kv|
    self addAnimation: (GsAnimation new fromData: kv value) as:kv key]
]

{ #category : #accessing }
GsSketch >> animationsDescription [
  <magritteDescription>
  ^ GsDescriptionWrapper new for: 
    (GsAnimationsDescription new
      label: 'Animations';
      accessor: #animationsData);
    jsonKey: #animations

]

{ #category : #accessing }
GsSketch >> animationsJson [
  ^ GsAnimationsDescription new
    accessor: #animationsData
]

{ #category : #accessing }
GsSketch >> asScene [
  ^ self
]

{ #category : #magritte }
GsSketch >> brokenAnimationsDescription [
  "<magritteDescription> !! browse senders to see example of how it's broken."
  ^ MAToManyRelationDescription new
    label: 'Animations';
    accessor: #animations
]

{ #category : #accessing }
GsSketch >> clear [
  self removeChildren.
  idCounter := 0.
  animations := OrderedDictionary new.
  lists := OrderedDictionary new.
]

{ #category : #accessing }
GsSketch >> currentAnimation [
  <returns:#GsAnimation>
  ^ currentAnimation ifNil: [
    currentAnimation := self newAnimationNamed:  #default]
]

{ #category : #animation }
GsSketch >> gotoFrame: i [
  currentAnimation gotoFrame: i
]

{ #category : #accessing }
GsSketch >> idCounter [
	^ idCounter
]

{ #category : #accessing }
GsSketch >> idCounter: anObject [
	idCounter := anObject
]

{ #category : #accessing }
GsSketch >> idCounterDescription [
  ^ MANumberDescription new
    label: 'id counter';
    accessor: #idCounter
]

{ #category : #accessing }
GsSketch >> idFromNumber: aNumber [ 
  ^ ('id', (aNumber printStringLength: 4 padded: true)) asSymbol.
]

{ #category : #initialization }
GsSketch >> initialize [
  super initialize.
  self clear.
]

{ #category : #accessing }
GsSketch >> listData [
  ^ lists collect: [:o| o asData select: [:id|
      self childNamed:id ifFound: [true] ifNone: [false]]]
]

{ #category : #accessing }
GsSketch >> listNames [
  ^ lists keys
]

{ #category : #animations }
GsSketch >> newAnimationNamed: aSymbol [
  animations at: aSymbol
    ifPresent: [ self error:
      'Duplicate animation name: ', aSymbol asString].
  ^ self addAnimation: GsAnimation new as: aSymbol
]

{ #category : #accessing }
GsSketch >> nextId [
  | r |
  r :=  self idFromNumber: idCounter.
  idCounter := idCounter + 1.
  ^ r
]

{ #category : #accessing }
GsSketch >> nextId: aNumber [
  idCounter := aNumber
]
