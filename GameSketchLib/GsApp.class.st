"
I am an application for displaying a {{gtClass:GsScene}}.

"
Class {
	#name : #GsApp,
	#superclass : #GsObject,
	#instVars : [
		'scene',
		'sceneHolder',
		'ui'
	],
	#category : #'GameSketchLib-Apps'
}

{ #category : #'gt - inspector' }
GsApp >> asElement [
  ^ ui
]

{ #category : #'gt inspector' }
GsApp >> gtLiveFor: aView [
  <gtView>
  self ui hasParent ifTrue: [^ aView empty].
  ^ aView explicit
    title: 'Live';
    priority: -1;
    stencil: [self ui]
]

{ #category : #'gt inspector' }
GsApp >> gtRunButtonFor: anAction [
  <gtAction>
  ^ anAction button
    icon: BrGlamorousVectorIcons play;
    action: [ :aButton | aButton phlow spawnObject: self class new];
    yourself
]

{ #category : #initialization }
GsApp >> initialize [
  super initialize.
  scene := self makeStartScene.
  self makeUI
]

{ #category : #'gsl - ui' }
GsApp >> makeSceneHolder [
  "note: I removed BrHorizontalPane so the scene editor overlays can work for pileup, etc."
  ^ sceneHolder := GsObject new matchParent addChild: scene
]

{ #category : #'gsl - ui' }
GsApp >> makeStartScene [
 ^ GsScene new
]

{ #category : #accessing }
GsApp >> makeUI [
  ^ ui := BrVerticalPane new matchParent
    addChild: self makeSceneHolder as: #sceneHolder.
]

{ #category : #accessing }
GsApp >> scene [
	^ scene
]

{ #category : #accessing }
GsApp >> scene: aScene [
  |old | old := sceneHolder childNamed: #scene.
  scene := aScene.
  sceneHolder replaceChild: old with: aScene as: #scene.
]

{ #category : #accessing }
GsApp >> ui [
	^ ui
]
