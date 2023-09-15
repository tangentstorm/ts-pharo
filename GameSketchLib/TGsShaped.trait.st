"
I provide some standard properties for all shapes.

"
Trait {
	#name : #TGsShaped,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #traversing }
TGsShaped >> subShapes [
  "not all children are shapes. complex elements can be a single shape."
  "subshapes should be owned by and contained in the current shape."
  "(that is, list members are not necessarily subshapes)"
  ^ { }
]

{ #category : #traversing }
TGsShaped >> withAllSubShapes [
  ^ { self }, self subShapes
]

{ #category : #traversing }
TGsShaped >> withAllSubShapesDo: aBlock [
  self withAllSubShapes do: aBlock
]
