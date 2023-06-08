Class {
	#name : #GsPathmapDemo,
	#superclass : #GsApp,
	#instVars : [
		'mon',
		'depth',
		'degree'
	],
	#category : #GameSketchLib
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
  super initialize.

]

{ #category : #accessing }
GsPathmapDemo >> makeGraph: connected layout: aSymbol [
  | xs |
  xs := 0 to: (degree ** depth  - 1 / (degree-1))-1.
  mon := GtMondrian new.
  mon nodes
    shape: [:i| (GsCell for: i+1) asElement
                   background: GsColors gold];
	with: xs.

  connected ifTrue:[
	1 to: degree do: [:j| mon
	  edges connect: xs from: #yourself to: [:i|
	    degree * i + j ]]].

  mon layout perform: aSymbol.
^ mon
]

{ #category : #accessing }
GsPathmapDemo >> makeStartScene [
 ^ BrVerticalPane new 
"   addChild: (self makeGraph: false layout: #horizontal) asElement;
"   addChild: (self makeGraph: true layout: #tree) asElement;
   constraintsDo: [:c|
     c vertical matchParent.
     c horizontal matchParent ]


]

{ #category : #accessing }
GsPathmapDemo >> makeUI [
  ^ self makeStartScene
]
