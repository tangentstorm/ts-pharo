"
I am a visual layer that matches my parent's bounds and apply a transformation to my children.

By scaling and scrolling several layers at once, I can be used to create parallax and other ""2.5d"" effects.

"
Class {
	#name : #GsLayer,
	#superclass : #GsObject,
	#traits : 'TBlWithChildrenTransformation',
	#classTraits : 'TBlWithChildrenTransformation classTrait',
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsLayer >> initialize [
  super initialize.
  self matchParent.
]
