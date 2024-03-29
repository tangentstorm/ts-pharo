Class {
	#name : #GsCatmullRomCurveElement,
	#superclass : #BlCurveElement,
	#instVars : [
		'anchors'
	],
	#category : #'GameSketchLib-Curves'
}

{ #category : #accessing }
GsCatmullRomCurveElement >> addAnchor: anAnchor [
  anchors add: anAnchor.
  self registerAnchor: anAnchor.
]

{ #category : #accessing }
GsCatmullRomCurveElement >> defaultGeometry [
	^ GsCatmullRomCurveGeometry
	 new
]

{ #category : #accessing }
GsCatmullRomCurveElement >> initialize [
  super initialize.
  self geometry: GsCatmullRomCurveGeometry new.
  anchors := OrderedCollection new.
]

{ #category : #accessing }
GsCatmullRomCurveElement >> layoutBounds [
  <return: #Rectangle>
  ^ anchors ifEmpty: [Rectangle origin: 0@0 extent: 0@0]
	ifNotEmpty: [ Rectangle encompassing:
	 (anchors collect: [:a|a positionWithin: self])]
]

{ #category : #accessing }
GsCatmullRomCurveElement >> measureGeometry [
	| origin |
	origin := self layoutBounds origin.
	self geometry points:
	  (anchors collect: [ :a | (a positionWithin: self) - origin ])
]

{ #category : #accessing }
GsCatmullRomCurveElement >> points: aCollection [
	anchors :=  (aCollection collect: [:p |
	  BlAbsolutePositionAnchor position: p ])
]
