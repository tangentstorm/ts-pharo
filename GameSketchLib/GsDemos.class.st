Class {
	#name : #GsDemos,
	#superclass : #Object,
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsDemos >> gtAnimationDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 50;
    title: 'PlayerApp';
    stencil: [
      GsPlayerApp new scene: 
        GsAnimationExamples twoMovingSquares sketch  ];
    actionButtonIcon: BrGlamorousIcons inspect
    tooltip: 'Inspect Demo Class'
    action: [:btn| btn phlow spawnObject:
        GsAnimationExamples twoMovingSquares]
]

{ #category : #accessing }
GsDemos >> gtBulletDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 20;
    title: 'BulletDemo';
    stencil: [GsBulletDemo new];
    actionButtonIcon: BrGlamorousIcons inspect
    tooltip: 'Inspect Demo Class'
    action: [:btn| btn phlow spawnObject: GsBulletDemo new]
]

{ #category : #accessing }
GsDemos >> gtOverlapDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 10;
    title: 'OverlapDemo';
    stencil: [GsOverlapDemo new];
    actionButtonIcon: BrGlamorousIcons inspect
    tooltip: 'Inspect Demo class'
    action: [:btn| btn phlow spawnObject: GsOverlapDemo new]
]

{ #category : #accessing }
GsDemos >> gtPathmapDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 30;
    title: 'PathmapDemo';
    stencil: [GsPathmapDemo new];
    actionButtonIcon: BrGlamorousIcons inspect
    tooltip: 'Inspect Demo Class'
    action: [:btn| btn phlow spawnObject: GsPathmapDemo new]
]

{ #category : #accessing }
GsDemos >> gtPrintFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #accessing }
GsDemos >> gtRawFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #accessing }
GsDemos >> gtSketchDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 0;
    title: 'SketchApp';
    stencil: [GsSketchApp for: GsSceneExamples spaceScene ];
    actionButtonIcon: BrGlamorousIcons inspect
    tooltip: 'Inspect Demo class'
    action: [:btn| btn phlow spawnObject:
      (GsSketchApp for: GsSceneExamples spaceScene)]
]
