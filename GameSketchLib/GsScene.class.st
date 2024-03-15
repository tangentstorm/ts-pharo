"
I am a top-level {{gtClass:GsSketch}}, with a background.

My instances can be chained together to make complex games or presentations.

"
Class {
	#name : #GsScene,
	#superclass : #GsSketch,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsScene >> childrenDescription [
  <magritteDescription>
  ^ MAToManyRelationDescription new
    label: 'children';
    accessor: #children;
    priority: 100.
]

{ #category : #accessing }
GsScene >> gsSvgOn: aStream [
  aStream nextPutAll: '<svg viewBox="',self svgViewBox,'"',
     ' xmlns="http://www.w3.org/2000/svg"',
     ' style="background:',self gsFill,'">'; lf.
  self children do: [:o| o gsSvgOn: aStream. aStream lf].
  aStream nextPutAll: '</svg>'.
]

{ #category : #accessing }
GsScene >> initialize [
  super initialize.
  self matchParent background: GsColor defaultBg
]

{ #category : #accessing }
GsScene >> svgViewBox [
  | bp be |
  bp := self bounds position roundTo: 0.001.
  be := self bounds extent roundTo: 0.001.
  ^ bp x asString,' ',bp y asString,' ',
    be x asString,' ',be y asString
]
