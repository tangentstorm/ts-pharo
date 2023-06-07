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

{ #category : #initialization }
GsApp >> initialize [
  scene := self makeStartScene.
  ui := self makeUI.
]

{ #category : #'gsl - scenes' }
GsApp >> makeEmptyScene [
  ^ GsScene new
]

{ #category : #'gsl - scenes' }
GsApp >> makeSketchScene [
  ^ GsSketchScene new
]

{ #category : #'gsl - ui' }
GsApp >> makeStartScene [
 ^ scene := self makeEmptyScene
]

{ #category : #'gsl - ui' }
GsApp >> makeToolBar [
^ BrToolbar new
  aptitude: BrMaterialToolbarAptitude;
  addItem: (BrButton new 
    aptitude: BrMaterialToggleLabelledAptitude;
    label: 'Hello?'; 
    action: [ self inform: 'Hello!' ]);
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
