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
GsPathmapDemo >> initialize [
  degree := 2. depth := 4.
  super initialize.

]

{ #category : #accessing }
GsPathmapDemo >> makeGraph: connected layout: aSymbol [
  "num_nodes := +/degree ^i.depth NB. in j"
  | xs |
  xs := 0 to: (degree ** depth  - 1 / (degree-1))-1.
  mon := GtMondrian new.
  mon nodes
    shape: [:i| (GsCell for: i) asElement
                   background: GsColors gold];
	with: xs.

  connected ifTrue:[
	1 to: degree do: [:j| mon
	  edges connect: xs from: #value to: [:i| degree * i + j ]]].

  mon layout perform: aSymbol.
^ mon
]

{ #category : #accessing }
GsPathmapDemo >> makeStartScene [
 ^ BrHorizontalPane new 
   addChild: (self makeGraph: false layout: #vertical) asElement;
   addChild: (self makeGraph: true layout: #horizontalTree) asElement;
   constraintsDo: [:c|
     c vertical matchParent.
     c horizontal matchParent ]


]

{ #category : #accessing }
GsPathmapDemo >> makeUI [
  ^ self makeStartScene
]
