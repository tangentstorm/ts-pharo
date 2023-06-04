Class {
	#name : #GsApp,
	#superclass : #Object,
	#instVars : [
		'scene',
		'ui'
	],
	#category : #GameSketchLib
}

{ #category : #'gt inspector' }
GsApp >> asElement [
  ^ ui
]

{ #category : #'gt inspector' }
GsApp >> gtLiveFor: aView [
  <gtView>
^ aView explicit
  title: 'Live';
  priority: 10;
  stencil: [self ui]
]

{ #category : #'gt inspector' }
GsApp >> gtRunButtonFor: anAction [
  <gtAction>
^ anAction button
  icon: BrGlamorousVectorIcons play;
  action: [ :aButton |
    aButton phlow spawnObject: self class new];
  yourself
]

{ #category : #accessing }
GsApp >> initialize [
  scene := self makeStartScene.
  ui := self makeUI.
]

{ #category : #'gsl - sketching' }
GsApp >> makeNode [
  |node|
node := BrVerticalPane new size: 75@45;
  background: Color white;
  addEventHandler: BlPullHandler new;
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    node background: Color random].
^ node
]

{ #category : #'gsl - sketching' }
GsApp >> makeSketchScene [
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

{ #category : #'gsl - ui' }
GsApp >> makeStartScene [
 ^ scene := self makeSketchScene
]

{ #category : #'gsl - ui' }
GsApp >> makeToolBar [
^ BrToolbar new
  aptitude: BrMaterialToolbarAptitude;
  addItem: (BrButton new 
    aptitude: BrMaterialToggleLabelledAptitude;
    label: 'Hello?'; 
    action: [ self inform: 'Hello!' ]);
  addItem: (BrButton new 
    aptitude: BrMaterialToggleLabelledAptitude;
    label: '+'; 
    action: [ self scene addChild: 
      (self makeNode relocate: 10@10) ]);
  yourself
]

{ #category : #'gsl - ui' }
GsApp >> makeUI [
ui := BrVerticalPane new
  constraintsDo: [ :c |
    c horizontal matchParent.
	c vertical matchParent ];
  background: GsColors toolBg;
  addChild: (self makeToolBar);
  addChild: (self scene).
^ ui
]

{ #category : #accessing }
GsApp >> scene [
	^ scene
]

{ #category : #accessing }
GsApp >> scene: anObject [
	scene := anObject
]

{ #category : #accessing }
GsApp >> ui [
	^ ui
]

{ #category : #accessing }
GsApp >> ui: anObject [
	ui := anObject
]
