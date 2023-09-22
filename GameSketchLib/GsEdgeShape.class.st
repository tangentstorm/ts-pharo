Class {
	#name : #GsEdgeShape,
	#superclass : #GsLineShape,
	#instVars : [
		'dst',
		'src'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsEdgeShape >> dst: aNodeShape [
  dst := aNodeShape.
  self rebuildShape.
]

{ #category : #accessing }
GsEdgeShape >> gsPosition [
  "edges are always positioned based on the attached nodes"
  ^ 0@0
]

{ #category : #accessing }
GsEdgeShape >> gsPosition: aPoint [
  "position is calculated, so ignore"
]

{ #category : #accessing }
GsEdgeShape >> rebuildShape [
  self
    fromAnchor: (BlNearestPositionBoundsAnchor
      nearestTo: dst from: src);
    toAnchor: (BlNearestPositionBoundsAnchor
      nearestTo: src from: dst)
]

{ #category : #accessing }
GsEdgeShape >> src [
  ^ src
]

{ #category : #accessing }
GsEdgeShape >> src: aNodeShape [
  src := aNodeShape.
  dst ifNotNil: [ self rebuildShape ]
]
