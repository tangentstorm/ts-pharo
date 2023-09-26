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
  ^ BlArrowheadCircle new scale: 10
]

{ #category : #accessing }
GsMarker class >> none [
  ^ BlArrowheadNone new
]

{ #category : #accessing }
GsMarker class >> square [
  ^ BlArrowheadRectangle new scale: 3.15
]

{ #category : #accessing }
GsMarker class >> triangle [
  ^ BlArrowheadTriangle new
    scale: 7.5
]
