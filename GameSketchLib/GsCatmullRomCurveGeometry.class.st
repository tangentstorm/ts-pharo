Class {
	#name : #GsCatmullRomCurveGeometry,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'points'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsCatmullRomCurveGeometry >> buildPathOnSpartaCanvas: aCanvas [
  |path p0 p1 p2 p3|
  p0 := self points first.
  p1 := self points second.
  p2 := self points third.
  p3 := self points fourth.
  path := aCanvas path moveTo: p1.
  self drawSegmentOn: path alpha: 0.5 p0: p0 p1: p1 p2: p2 p3:p3.
  ^ path build
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> containsPoint: aPoint in: anElement on: aSpartaCanvas [
	"Note: I am a fallback method to determine if a point lies within a geometry path
	when geometry is complex and it is mathematically difficult to compute manually.
	(copied from BlBezierCurve)"
	<return: #Boolean>
	| aPath |
	
	aPath := pathCache pathOnSpartaCanvas: aSpartaCanvas.
	^ aSpartaCanvas stroke
		path: aPath;
		width: (anElement border width max: 6);
		containsPoint: aPoint
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> drawSegmentOn: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
   | t0 t1 t2 t3 A1 A2 A3 B1 B2 C |
    t0 := 0.0.
    t1 := self getT: t0 alpha: alpha p0: p0 p1: p1.
    t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
    t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.
    
    0.0 to: 1 by: 0.05 do: [:i| |t|
      t := (1-i * t1) + (i * t2).
    
      A1 := (((t1 - t) / (t1 - t0)) * p0) + ((t - t0) / (t1 - t0) * p1).
      A2 := (((t2 - t) / (t2 - t1)) * p1) + ((t - t1) / (t2 - t1) * p2).
      A3 := (((t3 - t) / (t3 - t2)) * p2) + ((t - t2) / (t3 - t2) * p3).
    
      B1 := (((t2 - t) / (t2 - t0)) * A1) + ((t - t0) / (t2 - t0) * A2).
      B2 := (((t3 - t) / (t3 - t1)) * A2) + ((t - t1) / (t3 - t1) * A3).
    
      C := (((t2 - t) / (t2 - t1)) * B1) + ((t - t1) / (t2 - t1) * B2).
      
      aPath lineTo: C]

]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> geometryBounds: aBounds [
  ^ (aBounds rectangle: (self points
    ifEmpty: [ 0@0 extent: 0@0 ]
    ifNotEmpty: [ :thePoints |
      Rectangle encompassing: thePoints ]))
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> getT: t alpha: alpha p0: p0 p1: p1 [
  | d a b |
  d := p1 - p0.
  a := d dotProduct: d.
  b := a raisedTo: alpha * 0.5.
  ^ b + t.
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> initialize [
  super initialize.
  points := #()
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> matchExtent: aPoint [
  extent := aPoint
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> points [
	^ points
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> points: aCollection [
	points := aCollection.
	self releaseCache
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> xdrawSegmentOn: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
  | t1 t2 t3 k0 k1 k2 k3 k4 k5 d31 d21 |

  t1 := self getT:  0 alpha: alpha p0: p0 p1: p1.
  t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
  t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.

  k0 := p0 / t1.        k1 := p1 / t1.
  k2 := p1 / (t2 - t1). k3 := p2 / (t2 - t1).
  k4 := p2 / (t3 - t2). k5 := p3 / (t3 - t2).
  d31 := t3 - t1. d21 := t2 - t1.
  
  0 to: 1 by: 0.05 do: [:t |
    |d3t d2t d1t A1 A2 A3 B1 B2 C|
    d3t := t3 - t.  d2t := t2 - t.  d1t := t1 - t.
  
    A1 := d1t * k0 + (t   * k1).
    A2 := d2t * k2 - (d1t * k3).
    A3 := d3t * k4 - (d2t * k5).
    B1 := d2t * A1 - (t   * A2) / t2.
    B2 := d3t * A2 - (d1t * A3) / d31.
    C  := d2t * B1 + (d1t * B2) / d21.

    aPath lineTo: C ]
]
