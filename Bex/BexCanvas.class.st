Class {
	#name : #BexCanvas,
	#superclass : #Object,
	#instVars : [
		'nids'
	],
	#category : #Bex
}

{ #category : #accessing }
BexCanvas >> add: aNid [
  nids add: aNid.
]

{ #category : #accessing }
BexCanvas >> gtDrawingFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Drawing';
    stencil: [self stencil].
]

{ #category : #accessing }
BexCanvas >> initialize [
  nids := OrderedCollection new.
]

{ #category : #accessing }
BexCanvas >> stencil [
  |root|
  root := BlElement new
    size: 640@480;
    border: (BlBorder paint: Color black);
    background: (Color fromHexString: '336699').
  nids do: [:each|
    root addChild: (each stencil
      addEventHandler: BlPullHandler new disallowOutOfBounds)].
  ^ root
]
