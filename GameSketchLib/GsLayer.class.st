"
I am a visual layer that matches my parent's bounds and apply a transformation to my children.

By scaling and scrolling several layers at once, I can be used to create parallax and other ""2.5d"" effects.

"
Class {
	#name : #GsLayer,
	#superclass : #GsObject,
	#traits : 'TBlWithChildrenTransformation',
	#classTraits : 'TBlWithChildrenTransformation classTrait',
	#instVars : [
		'childOrigin',
		'scaleFactor',
		'zoomStep'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsLayer >> childOrigin [
  ^ childOrigin
]

{ #category : #accessing }
GsLayer >> childOrigin: aPoint [
  childOrigin := aPoint.
  self rebuildTransformation
]

{ #category : #initialization }
GsLayer >> initialize [
  super initialize.
  self hMatchParent vMatchParent.
  childOrigin := 0@0.
  scaleFactor := 1.0.
  zoomStep := 0.05.
]

{ #category : #accessing }
GsLayer >> rebuildTransformation [
  self childrenTransformDo: [:t|
    t scaleBy: scaleFactor.
    t translateBy: childOrigin ]
]

{ #category : #accessing }
GsLayer >> scaleFactor [
  ^ scaleFactor
]

{ #category : #accessing }
GsLayer >> scaleFactor: anObject [
  scaleFactor := anObject.
  self rebuildTransformation
]

{ #category : #accessing }
GsLayer >> zoomIn [
  self scaleFactor: scaleFactor + zoomStep
]

{ #category : #accessing }
GsLayer >> zoomOut [
  self scaleFactor: scaleFactor - zoomStep
]
