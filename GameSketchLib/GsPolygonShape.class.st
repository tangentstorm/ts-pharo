Class {
	#name : #GsPolygonShape,
	#superclass : #BlPolygonElement,
	#traits : 'TGsShaped',
	#classTraits : 'TGsShaped classTrait',
	#category : #'GameSketchLib-Shapes'
}

{ #category : #creating }
GsPolygonShape class >> newAtPoint: aPoint [
  ^ self new vertices: {aPoint}
]

{ #category : #accessing }
GsPolygonShape >> addPoint: aPoint [
  self anchors: anchors,
    {BlAbsolutePositionAnchor position: aPoint}
]

{ #category : #accessing }
GsPolygonShape >> at: anIndex [
  "return the point at the given index"
  ^ (anchors at: anIndex) position
]

{ #category : #accessing }
GsPolygonShape >> at: anIndex put: aPoint [
  (anchors at: anIndex) position: aPoint.
  self rebuild
]

{ #category : #handles }
GsPolygonShape >> gsHandles [
  ^ (1 to: anchors size) collect: [:i |
    self handleForPointAt: i]  
]

{ #category : #handles }
GsPolygonShape >> handleForPointAt: anIndex [
  ^ GsHandle new for: self prop: (self propForPointAt: anIndex)
]

{ #category : #handles }
GsPolygonShape >> handlesForLastPoint [
  ^ self handleForPointAt: anchors size
]

{ #category : #accessing }
GsPolygonShape >> initialize [
  super initialize bePolyline
]

{ #category : #accessing }
GsPolygonShape >> propForPointAt: anIndex [
  ^ GsAtIndexProp new target: self; index: anIndex
]

{ #category : #accessing }
GsPolygonShape >> rebuild [
]
