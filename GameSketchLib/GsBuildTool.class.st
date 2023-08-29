Class {
	#name : #GsBuildTool,
	#superclass : #GsTool,
	#instVars : [
		'shapeClass'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsBuildTool class >> for: aShapeClass [
  ^ self new shapeClass: aShapeClass
]

{ #category : #accessing }
GsBuildTool >> click: aPoint [
  sceneBuilder 
    shapeClass: shapeClass;
    newAtPoint: aPoint.
]

{ #category : #accessing }
GsBuildTool >> dragStart: aPoint [
  self click: aPoint.
  overlay addChild: (GsHandle new point: aPoint)
]

{ #category : #accessing }
GsBuildTool >> dragStep: aPoint [
  sceneBuilder secondPoint: aPoint
]

{ #category : #accessing }
GsBuildTool >> dragStop: aPoint [
  overlay removeChildren
]

{ #category : #initialization }
GsBuildTool >> initialize [
  super initialize.
]

{ #category : #accessing }
GsBuildTool >> label [
  ^ shapeClass name splitCamelCase second asLowercase
]

{ #category : #accessing }
GsBuildTool >> shapeClass: aShapeClass [ 
  shapeClass := aShapeClass
]
