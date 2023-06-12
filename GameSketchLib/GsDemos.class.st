Class {
	#name : #GsDemos,
	#superclass : #Object,
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsDemos >> gtBulletDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 20;
    title: 'BulletDemo';
    stencil: [GsBulletDemo new asElement]
]

{ #category : #accessing }
GsDemos >> gtOverlapDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 10;
    title: 'OverlapDemo';
    stencil: [GsOverlapDemo new asElement]
]

{ #category : #accessing }
GsDemos >> gtPathmapDemoFor: aView [
  <gtView>
  ^ aView explicit
    priority: 30;
    title: 'PathmapDemo';
    stencil: [GsPathmapDemo new asElement]
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
    priority: 30;
    title: 'SketchDemo';
    stencil: [GsSketchDemo new asElement]
]
