"
I tell my {{gtClass:GsToolApp}}'s {{gtClass:GsSceneBuilder}} to build new shapes.
"
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

{ #category : #'event handling' }
GsBuildTool >> click: aPoint [
  sceneBuilder 
    shapeClass: shapeClass;
    newAtPoint: aPoint.
]

{ #category : #'event handling' }
GsBuildTool >> dragStart: aPoint [
  self click: aPoint.
]

{ #category : #'event handling' }
GsBuildTool >> dragStep: aPoint [
  sceneBuilder secondPoint: aPoint
]

{ #category : #'event handling' }
GsBuildTool >> dragStop: aPoint [
  selection reset; add: sceneBuilder latestShape
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
