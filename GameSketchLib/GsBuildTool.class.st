Class {
	#name : #GsBuildTool,
	#superclass : #GsTool,
	#instVars : [
		'builder'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsBuildTool class >> for: aShapeClass [
  ^ self new shapeClass: aShapeClass
]

{ #category : #accessing }
GsBuildTool >> click: aPoint [
  builder newAtPoint: aPoint.
]

{ #category : #accessing }
GsBuildTool >> dragEnd: aPoint [
  overlay removeChildren
]

{ #category : #accessing }
GsBuildTool >> dragStart: aPoint [
  self click: aPoint.
  overlay addChild: (GsHandle new point: aPoint)
]

{ #category : #accessing }
GsBuildTool >> dragStep: aPoint [
  builder secondPoint: aPoint
]

{ #category : #initialization }
GsBuildTool >> initialize [
  super initialize.
  builder := GsSceneBuilder new
     scene: scene;
     shapeClass: GsRectShape
]

{ #category : #accessing }
GsBuildTool >> label [
  ^ builder shapeClass name splitCamelCase second asLowercase
]

{ #category : #accessing }
GsBuildTool >> scene: aScene [
  super scene: aScene.
  builder scene: aScene.
]

{ #category : #accessing }
GsBuildTool >> shapeClass: aShapeClass [ 
  builder shapeClass: aShapeClass
]
