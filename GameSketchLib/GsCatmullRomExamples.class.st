Class {
	#name : #GsCatmullRomExamples,
	#superclass : #BlGeometryElementExamples,
	#category : #'GameSketchLib-Examples'
}

{ #category : #'instance creation' }
GsCatmullRomExamples >> curve [
	<gtExample>
	
	^ GsCatmullRomCurveElement new
		zIndex: 10;
		yourself
]

{ #category : #'example - connections' }
GsCatmullRomExamples >> curveWithAnchors [
	<gtExample>	
	| redCurve handles colors |
	
	redCurve := self redCurve.
	colors := { Color green. Color blue. Color blue. Color red. }.
	handles := { 100@100 . 200@300 . 400@300. 200@100 }
	  collectWithIndex: [:p :i| |el|
	  el := self attachPoint
	    relocate: p;
	    background: (colors at: i).
	    
	  redCurve addAnchor:
	    (BlElementCenterAnchor element: el).
	  el ].

	^ self container addChildren: handles; 
	  addChild: redCurve 
]

{ #category : #'example - visual properties' }
GsCatmullRomExamples >> greyLine [
	<gtExample>

	^ self line
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 1)
]

{ #category : #'instance creation' }
GsCatmullRomExamples >> line [
	<gtExample>
	
	^ BlLineElement new
		zIndex: 10;
		yourself
]

{ #category : #'example - connections' }
GsCatmullRomExamples >> quadraticCurveWithAnchors [
	<gtExample>	
	| redCurve attachFrom attachTo viaAttach fromLine toLine |
	
	redCurve := self redCurve.
	
	attachFrom := self attachPoint.
	attachFrom relocate: 10 @ 160.

	viaAttach := self attachPoint.
	viaAttach relocate: 160 @ 10.

	attachTo := self attachPoint.
	attachTo relocate: 310 @ 160.

	fromLine := self greyLine.
	fromLine fromAnchor: (BlElementCenterAnchor element: attachFrom).
	fromLine toAnchor: (BlElementCenterAnchor element: viaAttach).
	
	toLine := self greyLine.
	toLine fromAnchor: (BlElementCenterAnchor element: viaAttach).
	toLine toAnchor: (BlElementCenterAnchor element: attachTo).

	redCurve fromAnchor: (BlElementCenterAnchor element: attachFrom).
	redCurve viaAnchor: (BlElementCenterAnchor element: viaAttach).
	redCurve toAnchor: (BlElementCenterAnchor element: attachTo).

	^ self container
		addChildren: { redCurve . attachFrom . viaAttach. attachTo . fromLine . toLine }
]

{ #category : #'example - connections' }
GsCatmullRomExamples >> quadraticCurveWithPerpendicularAnchor [
	<gtExample>	
	| redCurve attachFrom attachTo anchorFrom anchorTo perpendicularAnchor perpendicularAttach fromLine toLine connectLine |
	
	redCurve := self redCurve.
	
	attachFrom := self attachPoint relocate: 100 @ 100.
	attachTo := self attachPoint relocate: 300 @ 400.

	anchorFrom := BlElementCenterAnchor element: attachFrom.	
	anchorTo := BlElementCenterAnchor element: attachTo.
	
	perpendicularAnchor := BlPerpendicularAnchor new.
	"order of the reference anchors matters"
	perpendicularAnchor referenceAnchors: { anchorFrom . anchorTo }.
	"the length of a perpendicular is half of the distance"
	perpendicularAnchor curvature: 100.

	redCurve fromAnchor: anchorFrom.
	redCurve toAnchor: anchorTo.
	redCurve viaAnchor: perpendicularAnchor.
	
	"------ fancy look ------"
	
	"visual represenation of perpendicular anchor (does not influence the curve)"
	perpendicularAttach := BlEllipseElement radius: 15.
	perpendicularAttach background: (Color red alpha: 0.4).
	perpendicularAttach centerAnchor: perpendicularAnchor.
	
	"visual connection between anchors (does not influence the curve)"
	fromLine := self greyLine.
	fromLine fromAnchor: (BlElementCenterAnchor element: attachFrom).
	fromLine toAnchor: (BlElementCenterAnchor element: perpendicularAttach).
	
	"visual connection between anchors (does not influence the curve)"
	toLine := self greyLine.
	toLine fromAnchor: (BlElementCenterAnchor element: perpendicularAttach).
	toLine toAnchor: (BlElementCenterAnchor element: attachTo).
	
	"visual connection between anchors (does not influence the curve)"
	connectLine := self greyLine.
	connectLine fromAnchor: (BlElementCenterAnchor element: attachFrom).
	connectLine toAnchor: (BlElementCenterAnchor element: attachTo).

	^ self container
		addChildren: { redCurve . attachFrom . perpendicularAttach. attachTo . fromLine . toLine . connectLine }
]

{ #category : #'example - connections' }
GsCatmullRomExamples >> quadraticCurveWithPerpendicularFractionAnchor [
	<gtExample>	
	| redCurve attachFrom attachTo anchorFrom anchorTo perpendicularAnchor perpendicularAttach fromLine toLine connectLine |
	
	redCurve := self redCurve.
	
	attachFrom := self attachPoint relocate: 100 @ 100.
	attachTo := self attachPoint relocate: 300 @ 400.

	anchorFrom := BlElementCenterAnchor element: attachFrom.	
	anchorTo := BlElementCenterAnchor element: attachTo.
	
	perpendicularAnchor := BlPerpendicularFractionAnchor new.
	"order of the reference anchors matters"
	perpendicularAnchor referenceAnchors: { anchorFrom . anchorTo }.
	"the length of a perpendicular is half of the distance"
	perpendicularAnchor curvatureFraction: 0.5.

	redCurve fromAnchor: anchorFrom.
	redCurve toAnchor: anchorTo.
	redCurve viaAnchor: perpendicularAnchor.
	
	"------ fancy look ------"
	
	"visual represenation of perpendicular anchor (does not influence the curve)"
	perpendicularAttach := BlEllipseElement radius: 15.
	perpendicularAttach background: (Color red alpha: 0.4).
	perpendicularAttach centerAnchor: perpendicularAnchor.
	
	"visual connection between anchors (does not influence the curve)"
	fromLine := self greyLine.
	fromLine fromAnchor: (BlElementCenterAnchor element: attachFrom).
	fromLine toAnchor: (BlElementCenterAnchor element: perpendicularAttach).
	
	"visual connection between anchors (does not influence the curve)"
	toLine := self greyLine.
	toLine fromAnchor: (BlElementCenterAnchor element: perpendicularAttach).
	toLine toAnchor: (BlElementCenterAnchor element: attachTo).
	
	"visual connection between anchors (does not influence the curve)"
	connectLine := self greyLine.
	connectLine fromAnchor: (BlElementCenterAnchor element: attachFrom).
	connectLine toAnchor: (BlElementCenterAnchor element: attachTo).

	^ self container
		addChildren: { redCurve . attachFrom . perpendicularAttach. attachTo . fromLine . toLine . connectLine }
]

{ #category : #'example - visual properties' }
GsCatmullRomExamples >> redCurve [
	<gtExample>

	^ self curve border: (BlBorder paint: Color red width: 4)
]
