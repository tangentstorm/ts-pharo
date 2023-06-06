Class {
	#name : #GsSketchScene,
	#superclass : #BlElement,
	#instVars : [
		'current'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsSketchScene >> initialize [
  |scn|
scn := BlElement new constraintsDo: [ :c |
    c horizontal matchParent.
    c vertical matchParent ].
scn background: GsColors defaultBg;
  when: BlDoubleClickEvent do: [:e| |node|
    e consumed: true.
    scn addChild: (node := self makeNode).
    node relocate: e localPosition - (5@5)].
^ scn
]

{ #category : #accessing }
GsSketchScene >> makeNode [
  |node|
node := BrVerticalPane new size: 75@45;
  background: Color white;
  addEventHandler: BlPullHandler new;
  when: BlMouseDownEvent do: [:e|
    
     ];
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    node background: Color random].
^ node
]
