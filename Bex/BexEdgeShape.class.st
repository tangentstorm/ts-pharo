Class {
	#name : #BexEdgeShape,
	#superclass : #GsEdgeShape,
	#instVars : [
		'kind',
		'isInverted'
	],
	#category : #'Bex-Drawing'
}

{ #category : #accessing }
BexEdgeShape class >> kinds [
  ^ #( hi lo arrow )
]

{ #category : #accessing }
BexEdgeShape >> initialize [
  super initialize.
  kind := #arrow.
  isInverted := false.
  self rebuildEdge
]

{ #category : #accessing }
BexEdgeShape >> isInverted [
  ^ isInverted
]

{ #category : #accessing }
BexEdgeShape >> isInverted: aBit [
  isInverted := aBit.
  self rebuildEdge
]

{ #category : #accessing }
BexEdgeShape >> isInvertedDescription [
  <magritteDescription>
  ^ MABooleanDescription new
    label: 'is inverted';
    accessor: #isInverted
]

{ #category : #accessing }
BexEdgeShape >> kind [
  ^ kind
]

{ #category : #accessing }
BexEdgeShape >> kind: aSymbol [
  kind := aSymbol.
  self rebuildEdge.
]

{ #category : #accessing }
BexEdgeShape >> kindDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    label: 'kind';
    accessor: #kind;
    options: self class kinds
]

{ #category : #accessing }
BexEdgeShape >> rebuildEdge [
  | invMarker style |
  invMarker := isInverted ifTrue: [#circle] ifFalse: [#none].
  style := {
    #hi ->  { #none. invMarker. #solid }.
    #lo ->  { #none. invMarker. #dashed}.
    #arrow -> { invMarker. #triangle. #solid}}
    asDictionary at: kind.
  self srcMarker: style first;
       dstMarker: style second;
       gsStrokeStyle: style third
]
