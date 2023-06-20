Class {
	#name : #GsCanvas,
	#superclass : #GsObject,
	#category : #GameSketchLib
}

{ #category : #accessing }
GsCanvas >> extentChanged: anEvent [
  self transform centerOrigin; apply
]

{ #category : #accessing }
GsCanvas >> initialize [
  super initialize.
  self matchParent.
  self when: BlElementExtentChangedEvent do: [:e|
    self extentChanged:e]
]
