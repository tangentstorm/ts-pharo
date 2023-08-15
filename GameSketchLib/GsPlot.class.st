"
I draw an individual data series in a {{gtClass:GsChart}}.
"
Class {
	#name : #GsPlot,
	#superclass : #GsObject,
	#instVars : [
		'series',
		'stencil',
		'data'
	],
	#category : #'GameSketchLib-Charts'
}

{ #category : #accessing }
GsPlot class >> for: aCollection [
  self new data: aCollection
]

{ #category : #accessing }
GsPlot >> data: aCollection [
  data := aCollection
]

{ #category : #accessing }
GsPlot >> rebuildShape [
  "draw the markers"
  self subclassResponsibility
]
