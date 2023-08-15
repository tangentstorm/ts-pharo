Class {
	#name : #GsSceneBuilder,
	#superclass : #Object,
	#instVars : [
		'scene',
		'counts',
		'shape',
		'shapeClass'
	],
	#category : #'GameSketchLib-Editor'
}

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
GsSceneBuilder >> shapeClass: aShapeClass [
  shapeClass := aShapeClass 
]
