Class {
	#name : #GsPathShapeExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsPathShapeExamples class >> oneSegment [
  <gtExample>
  ^ (GsPathShape newAtPoint: 100@100)
      addPoint: 150 @ 100.
]

{ #category : #accessing }
GsPathShapeExamples >> polygon [
  <gtExample>
  | points anchors |
  points := { 100 @100. 200@100. 200@200}.
  anchors := points collect: [:o| BlAbsolutePositionAnchor position: o].
  ^ BlPolygonElement new
    bePolyline;
    border:Color gray;
    vertices: points

]
