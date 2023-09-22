Class {
	#name : #GsMarker,
	#superclass : #Object,
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsMarker class >> arrow [
  ^ BlArrowheadSimpleArrow new
    arrowLengthFraction: 5
]

{ #category : #accessing }
GsMarker class >> circle [
  ^ BlArrowheadCircle new
    " redundant due to bug in bloc:"
    geometry: BlCircleGeometry new;
    scale: 10
]

{ #category : #accessing }
GsMarker class >> none [
  ^ BlArrowheadNone new
]

{ #category : #accessing }
GsMarker class >> square [
  "!! this is a bug in Bloc."
  ^ BlArrowheadCircle new
    scale: 10
]

{ #category : #accessing }
GsMarker class >> triangle [
  ^ BlArrowheadTriangle new
    scale: 7.5
]
