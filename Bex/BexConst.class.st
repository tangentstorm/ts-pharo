Class {
	#name : #BexConst,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #Bex
}

{ #category : #accessing }
BexConst class >> new [
  instance ifNil: [instance := super new].
  ^ instance.
]

{ #category : #accessing }
BexConst >> border [
  ^ BlBorder paint: Color black.
]

{ #category : #accessing }
BexConst >> color [
  "a default color to be overridden"
  ^ Color cyan.
]

{ #category : #accessing }
BexConst >> geometry [
  ^ BlCircleGeometry new.
]

{ #category : #accessing }
BexConst >> gtDrawingFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Drawing';
    stencil: [self stencil].
]

{ #category : #accessing }
BexConst >> size [
  ^ 32@32.
]

{ #category : #accessing }
BexConst >> stencil [
  ^ BlElement new
    geometry: self geometry;
    background: self color;
    border: self border;
    size: self size.
]
