Class {
	#name : #GsEdgeShape,
	#superclass : #GsLineShape,
	#instVars : [
		'dst',
		'src',
		'srcMarker',
		'dstMarker'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsEdgeShape class >> markerNames [
  ^ #(none arrow circle triangle square)
]

{ #category : #accessing }
GsEdgeShape >> dst [
  ^ dst
]

{ #category : #accessing }
GsEdgeShape >> dst: aNodeShape [
  dst := aNodeShape.
  self rebuildShape.
]

{ #category : #accessing }
GsEdgeShape >> dstMarker [
  ^ dstMarker
]

{ #category : #accessing }
GsEdgeShape >> dstMarker: aSymbol [
  dstMarker := aSymbol.
  self rebuildShape
]

{ #category : #accessing }
GsEdgeShape >> dstMarkerDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    group: 'source';
    label: 'dst marker';
    options: GsEdgeShape markerNames;
    accessor: #dstMarker
  
]

{ #category : #accessing }
GsEdgeShape >> gsFill: aFill [
  super gsFill: aFill.
  self rebuildShape
]

{ #category : #accessing }
GsEdgeShape >> gsMoveBy: aPoint [
  "no. position is calculated"
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
GsEdgeShape >> initialize [
  srcMarker := #none.
  dstMarker := #triangle.
  super initialize.
  self background: (Color fromHexString: '333333')
]

{ #category : #accessing }
GsEdgeShape >> rebuildShape [
  self
    fromAnchor: (BlNearestPositionBoundsAnchor
      nearestTo: dst from: src);
    fromHead: ((GsMarker perform: srcMarker)
      background: self background;
      border: self border );
    toAnchor: (BlNearestPositionBoundsAnchor
      nearestTo: src from: dst);
    toHead: ((GsMarker perform: dstMarker)
      background: self background;
      border: self border )
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

{ #category : #accessing }
GsEdgeShape >> srcMarker [
  ^ srcMarker
]

{ #category : #accessing }
GsEdgeShape >> srcMarker: aSymbol [
  srcMarker := aSymbol.
  self rebuildShape
]

{ #category : #accessing }
GsEdgeShape >> srcMarkerDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    group: 'source';
    label: 'src marker';
    options: GsEdgeShape markerNames;
    accessor: #srcMarker
  
]
