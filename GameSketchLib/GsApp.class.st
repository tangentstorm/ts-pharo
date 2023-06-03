Class {
	#name : #GsApp,
	#superclass : #Object,
	#instVars : [
		'scene'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsApp >> gtLiveFor: aView [
  <gtView>
^ aView explicit title: 'Live';
  stencil: [self makeUI]
]

{ #category : #accessing }
GsApp >> gtRunButtonFor: anAction [
  <gtAction>
^ anAction button
  icon: BrGlamorousVectorIcons play;
  action: [ :aButton |
    aButton phlow spawnObject: self class new];
  yourself
]

{ #category : #accessing }
GsApp >> makeNode [
^ BrVerticalPane new
  background: Color paleBlue;
  size: 32@32;
  addEventHandler: BlPullHandler new;
  yourself
]

{ #category : #accessing }
GsApp >> makeStartScene [
scene := ( BlElement new size: 640@480;
  background: GsColors defaultBg;
  addChild: self makeNode;
  yourself).
^ scene
]

{ #category : #accessing }
GsApp >> makeToolBar [
^ BrToolbar new
  aptitude: BrMaterialToolbarAptitude;
  addItem: (BrButton new 
    aptitude: BrMaterialToggleLabelledAptitude;
    label: 'Hello!'; 
    action: [ self inform: 'Click on Hello!' ]);
  addItem: (BrButton new 
    aptitude: BrMaterialToggleLabelledAptitude;
    label: '+'; 
    action: [ self scene addChild: self makeNode ]);
  yourself
]

{ #category : #accessing }
GsApp >> makeUI [
^ BrVerticalPane new
  size:640@480; background: GsColors toolBg;
  addChild: (self makeToolBar);
  addChild: (self makeStartScene);
  yourself
]

{ #category : #accessing }
GsApp >> scene [
	^ scene
]

{ #category : #accessing }
GsApp >> scene: anObject [
	scene := anObject
]
