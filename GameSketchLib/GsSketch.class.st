"
I am a {{gtClass:GsGroup}} that  (in the future) can have attached scripts and be saved to disk. 
"
Class {
	#name : #GsSketch,
	#superclass : #GsShape,
	#instVars : [
		'animations',
		'currentAnimation'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsSketch class >> fromJSON: aString [ 
  "build a scene from a json string"
  ^ GsJsonReader new read: aString
]

{ #category : #animations }
GsSketch >> addAnimation: x [
  self error:
    'GsSketch animations require names. use addAnimation:as: to provide one.'
]

{ #category : #animations }
GsSketch >> addAnimation: anAnimation as: aSymbol [
  animations at: aSymbol put: (anAnimation sketch: self).
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
GsSketch >> animationsDescription [
  <magritteDescription>
  ^ MAToManyRelationDescription new
    label: 'Animations';
    accessor: #animations
]

{ #category : #accessing }
GsSketch >> asScene [
  ^ self
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

{ #category : #initialization }
GsSketch >> initialize [
  super initialize.
  animations := OrderedDictionary new.
]

{ #category : #animations }
GsSketch >> newAnimationNamed: aSymbol [
  animations at: aSymbol
    ifPresent: [ self error:
      'Duplicate animation name: ', aSymbol asString].
  ^ self addAnimation: GsAnimation new as: aSymbol
]
