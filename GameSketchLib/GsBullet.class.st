Class {
	#name : #GsBullet,
	#superclass : #GsObject,
	#category : #'GameSketchLib-Demos'
}

{ #category : #'as yet unclassified' }
GsBullet >> fire [
  active := true.
]

{ #category : #initialization }
GsBullet >> initialize [
  super initialize.
  self 
    geometry: BlRectangleGeometry new;
    size: (3@5) * 4;
    background: GsColors gold.
]
