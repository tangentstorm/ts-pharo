Class {
	#name : #BexCanvas,
	#superclass : #Object,
	#instVars : [
		'nids',
		'bgColor'
	],
	#category : #Bex
}

{ #category : #accessing }
BexCanvas >> add: aNid [
  nids add: aNid.
]

{ #category : #accessing }
BexCanvas >> constExample [
  <gtExample>
  ^ BexCanvas new
    add: BexO new;
    add: BexI new
]

{ #category : #accessing }
BexCanvas >> gtDrawingFor: aView [
  <gtView>
  ^ aView mondrian
    title: 'Drawing';
    priority: 10;
    painting: [:g|
      g nodes
        shape: [:x| x stencil];
        with: nids.
      g root
        background: bgColor.
      g layout tree]
]

{ #category : #accessing }
BexCanvas >> initialize [
  nids := OrderedCollection new.
  bgColor := Color fromHexString: '336699'.
]
