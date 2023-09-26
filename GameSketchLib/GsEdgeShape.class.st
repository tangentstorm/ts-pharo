Class {
	#name : #GsEdgeShape,
	#superclass : #GsLineShape,
	#instVars : [
		'dst',
		'src',
		'srcMarker',
		'dstMarker',
		'srcId',
		'dstId'
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
  dstId := dst id asSymbol.
  src ifNotNil: [self rebuildShape].
]

{ #category : #accessing }
GsEdgeShape >> dstId [
  ^ dstId
]

{ #category : #accessing }
GsEdgeShape >> dstId: aSymbol [
  dstId := aSymbol
]

{ #category : #magritte }
GsEdgeShape >> dstIdDescription [
  <magritteDescription>
  ^ MASymbolDescription new
    label: 'dest. node id';
    accessor: #dstId
]

{ #category : #accessing }
GsEdgeShape >> dstMarker [
  ^ dstMarker
]

{ #category : #accessing }
GsEdgeShape >> dstMarker: aSymbol [
  dstMarker := aSymbol asSymbol.
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
GsEdgeShape >> gsHandles [
  <todo: 'make handles that allow re-connecting to other shapes'>
  ^ #()
]

{ #category : #accessing }
GsEdgeShape >> gsIsPositionable [
  ^ false
]

{ #category : #accessing }
GsEdgeShape >> gsUpdateDependencies: idMap [
  idMap at: self srcId ifPresent: [:o| self src: o].
  idMap at: self dstId ifPresent: [:o| self dst: o].
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
  ((src isNil) or: [dst isNil]) ifTrue: [^self].
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
  srcId := src id asSymbol.
  dst ifNotNil: [ self rebuildShape ]
]

{ #category : #accessing }
GsEdgeShape >> srcId [
  ^ srcId
]

{ #category : #accessing }
GsEdgeShape >> srcId: aSymbol [
  srcId := aSymbol
]

{ #category : #magritte }
GsEdgeShape >> srcIdDescription [
  <magritteDescription>
  ^ MASymbolDescription new
    label: 'source node id';
    accessor: #srcId
]

{ #category : #accessing }
GsEdgeShape >> srcMarker [
  ^ srcMarker
]

{ #category : #accessing }
GsEdgeShape >> srcMarker: aSymbol [
  srcMarker := aSymbol asSymbol.
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
