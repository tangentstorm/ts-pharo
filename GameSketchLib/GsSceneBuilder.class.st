"
I provide a stateful builder for GsScene objects.

I can be used either with  {{gtClass:GtBuildTool}} inside a {{gtClass:GsToolApp}} for adding new shapes interactively, or invoked directly from smalltalk code.
"
Class {
	#name : #GsSceneBuilder,
	#superclass : #Object,
	#instVars : [
		'scene',
		'counts',
		'shape',
		'shapeClass'
	],
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsSceneBuilder class >> for: aScene [
  ^ self new scene:aScene 
]

{ #category : #'high level builders' }
GsSceneBuilder >> circle: name at: center radius: r [
  ^ self shapeClass: GsCircleShape;
    newAtPoint: center;
    secondPoint: center + (0@r);
    named: name
]

{ #category : #initialization }
GsSceneBuilder >> initialize [
  super initialize.
  scene := GsScene new.
  self shapeClass: GsRectShape
]

{ #category : #accessing }
GsSceneBuilder >> line: aName from: p1 to: p2 [
  ^ self shapeClass: GsLineShape;
    newAtPoint: p1;
    secondPoint: p2;
    named: aName
]

{ #category : #accessing }
GsSceneBuilder >> named: name [ 
  ^ shape id: name
]

{ #category : #accessing }
GsSceneBuilder >> newAtPoint: aPoint [
  shape := shapeClass newAtPoint: aPoint.
  scene addChild: shape.
]

{ #category : #accessing }
GsSceneBuilder >> rect: name at: topLeft size: aSize [
  ^ self shapeClass: GsRectShape;
    newAtPoint: topLeft;
    secondPoint: topLeft + aSize;
    named: name
]

{ #category : #accessing }
GsSceneBuilder >> scene [
	^ scene
]

{ #category : #accessing }
GsSceneBuilder >> scene: anObject [
	scene := anObject
]

{ #category : #accessing }
GsSceneBuilder >> secondPoint: xy [
  shape secondPoint: xy
]

{ #category : #accessing }
GsSceneBuilder >> shapeClass [
  ^ shapeClass
]

{ #category : #accessing }
GsSceneBuilder >> shapeClass: aShapeClass [
  shapeClass := aShapeClass 
]
