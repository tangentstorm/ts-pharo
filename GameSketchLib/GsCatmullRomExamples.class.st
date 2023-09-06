Class {
	#name : #GsCatmullRomExamples,
	#superclass : #BlGeometryElementExamples,
	#category : #'GameSketchLib-Examples'
}

{ #category : #'example - connections' }
GsCatmullRomExamples >> curveWithAnchors [
	<gtExample>	
	| curve points handles |
	
	curve := self grayCurve.

	points := {100@100. 200@100. 300@200. 300@300.
	            200@300. 200@200. 100@200. 100@300}.

	handles := points collectWithIndex: [:p :i| |el color|
	  color := Color blue.
	  (i = 1) ifTrue: [color := Color green darker ].
	  (i = points size) ifTrue: [color := Color red].
	  el := self attachPoint
	    relocate: p;
	    background: color;
	    addChild: (GsTextShape new 
	      text: (i asString);
	      textColor: '#ffffff').
	    curve addAnchor: (BlElementCenterAnchor element: el).
	    el ].

	^ self container addChildren: { curve }, handles.
]

{ #category : #'example - visual properties' }
GsCatmullRomExamples >> grayCurve [
	<gtExample>
	^ GsCatmullRomCurveElement new
	  border: (BlBorder paint: Color lightGray width: 4)
]
