Class {
	#name : #GsPathmapDemo,
	#superclass : #GsToolApp,
	#instVars : [
		'depth',
		'degree',
		'mondrian'
	],
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsPathmapDemo >> degree [
	^ degree
]

{ #category : #accessing }
GsPathmapDemo >> degree: anObject [
	degree := anObject
]

{ #category : #accessing }
GsPathmapDemo >> depth [
	^ depth
]

{ #category : #accessing }
GsPathmapDemo >> depth: anObject [
	depth := anObject
]

{ #category : #accessing }
GsPathmapDemo >> initialize [
  degree := 3. depth := 3.
  mondrian := GsMondrian new.
  mondrian nodes stencil: [:i|
    (GsCell for: i+1) asElement background: GsColor gold ].
  super initialize.

]

{ #category : #accessing }
GsPathmapDemo >> makeGraph: connected layout: aSymbol [
  | xs |
  xs := 0 to: (degree ** depth  - 1 / (degree-1))-1.
  mondrian nodes with: xs.
  connected ifTrue:[
	1 to: degree do: [:j| mondrian
	  edges connect: xs from: #yourself to: [:i|
	    degree * i + j ]]].

  mondrian layout perform: aSymbol.
  ^ mondrian
]

{ #category : #accessing }
GsPathmapDemo >> makeStartScene [
 ^ BrVerticalPane new 
   addChild: (self makeGraph: true layout: #tree) asElement;
   constraintsDo: [:c|
     c vertical matchParent.
     c horizontal matchParent ]


]

{ #category : #accessing }
GsPathmapDemo >> makeUI [
  ^ ui := scene
]

{ #category : #accessing }
GsPathmapDemo >> mondrian [
  ^ mondrian
]

{ #category : #accessing }
GsPathmapDemo >> scene: aScene [
	scene := aScene.
	sceneHolder removeChildNamed: #scene.
	sceneHolder addChild: scene as: #scene.
]
