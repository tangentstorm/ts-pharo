Class {
	#name : #GsCatmullRomCurveGeometry,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'points',
		'alpha'
	],
	#category : #'GameSketchLib-Curves'
}

{ #category : #accessing }
GsCatmullRomCurveGeometry >> alpha [
	^ alpha
]

{ #category : #accessing }
GsCatmullRomCurveGeometry >> alpha: anObject [
	alpha := anObject
]

{ #category : #sparta }
GsCatmullRomCurveGeometry >> buildPathOnSpartaCanvas: aCanvas [
  |path |
  path := aCanvas path.
  (points size > 3) ifTrue: [
    | p0 p1 p2 p3 i |
    p1 := points at: 1.
    p2 := points at: 2.
    p3 := points at: 3.
    i := 4.
    path moveTo: p2.
    [i <= points size] whileTrue: [
      p0 := p1. p1 := p2. p2 := p3.
      p3 := points at: i. i := i + 1.
      "error trap because of zero division (when p2=p3, for example)"
      [self drawSegmentOn: path p0: p0 p1: p1 p2: p2 p3:p3]
        onErrorDo: [path lineTo: p2] ]].
  ^ path build
]

{ #category : #'geometry testing' }
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

{ #category : #historical }
GsCatmullRomCurveGeometry >> drawSegmentOn0: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
  "unoptimized version"
  | t0 t1 t2 t3 A1 A2 A3 B1 B2 C |
  
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

{ #category : #historical }
GsCatmullRomCurveGeometry >> drawSegmentOn1: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
  "remove t0"
  | t1 t2 t3 A1 A2 A3 B1 B2 C |
  
  t1 := self getT:  0 alpha: alpha p0: p0 p1: p1.
  t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
  t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.

  0.0 to: 1 by: 0.05 do: [:i| |t|
    t := (1-i * t1) + (i * t2).
    
    A1 := (((t1 - t) / (t1     )) * p0) + ((t     ) / (t1     ) * p1).
    A2 := (((t2 - t) / (t2 - t1)) * p1) + ((t - t1) / (t2 - t1) * p2).
    A3 := (((t3 - t) / (t3 - t2)) * p2) + ((t - t2) / (t3 - t2) * p3).
    
    B1 := (((t2 - t) / (t2     )) * A1) + ((t     ) / (t2     ) * A2).
    B2 := (((t3 - t) / (t3 - t1)) * A2) + ((t - t1) / (t3 - t1) * A3).
    
    C := (((t2 - t) / (t2 - t1)) * B1) + ((t - t1) / (t2 - t1) * B2).
 
    aPath lineTo: C]

]

{ #category : #historical }
GsCatmullRomCurveGeometry >> drawSegmentOn2: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
  "name the diffs"
  | t1 t2 t3 d21 d32 d31 A1 A2 A3 B1 B2 C |
  
  t1 := self getT:  0 alpha: alpha p0: p0 p1: p1.
  t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
  t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.
  
  d21 := t2 - t1.
  d32 := t3 - t2.
  d31 := t3 - t1.

  0.0 to: 1 by: 0.05 do: [:i| |t|
    t := (1-i * t1) + (i * t2).
    
    A1 := (((t1 - t) / t1)  * p0) + ((t     ) / t1 * p1).
    A2 := (((t2 - t) / d21) * p1) + ((t - t1) / d21 * p2).
    A3 := (((t3 - t) / d32) * p2) + ((t - t2) / d32 * p3).
    
    B1 := (((t2 - t) / t2)  * A1) + ((t     ) / t2  * A2).
    B2 := (((t3 - t) / d31) * A2) + ((t - t1) / d31 * A3).
    
    C := (((t2 - t) /  d21) * B1) + ((t - t1) / d21 * B2).
 
    aPath lineTo: C]

]

{ #category : #historical }
GsCatmullRomCurveGeometry >> drawSegmentOn3: aPath alpha: alpha p0: p0 p1: p1 p2: p2 p3: p3 [
  "factor out common denominators"
  | t1 t2 t3 d21 d32 d31 A1 A2 A3 B1 B2 C |
  
  t1 := self getT:  0 alpha: alpha p0: p0 p1: p1.
  t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
  t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.
  
  d21 := t2 - t1.
  d32 := t3 - t2.
  d31 := t3 - t1.

  0.0 to: 1 by: 0.05 do: [:i| |t|
    t := (1-i * t1) + (i * t2).
    
    A1 := ((t1 - t) * p0) + ((t     ) * p1) / t1.
    A2 := ((t2 - t) * p1) + ((t - t1) * p2) / d21.
    A3 := ((t3 - t) * p2) + ((t - t2) * p3) / d32.
    
    B1 := ((t2 - t) * A1) + ((t     ) * A2) / t2.
    B2 := ((t3 - t) * A2) + ((t - t1) * A3) / d31.
    
    C  := ((t2 - t) * B1) + ((t - t1) * B2) / d21.
 
    aPath lineTo: C]

]

{ #category : #sparta }
GsCatmullRomCurveGeometry >> drawSegmentOn: aPath p0: p0 p1: p1 p2: p2 p3: p3 [
  | t1 t2 t3 d21 d32 d31 A1 A2 A3 B1 B2 C |
  
  t1 := self getT:  0 alpha: alpha p0: p0 p1: p1.
  t2 := self getT: t1 alpha: alpha p0: p1 p1: p2.
  t3 := self getT: t2 alpha: alpha p0: p2 p1: p3.
  
  d21 := t2 - t1.
  d32 := t3 - t2.
  d31 := t3 - t1.

  0.0 to: 1 by: 0.05 do: [:i| |t|
    t := (1-i * t1) + (i * t2).
    
    A1 := ((t1 - t) * p0) + ((t     ) * p1) / t1.
    A2 := ((t2 - t) * p1) + ((t - t1) * p2) / d21.
    A3 := ((t3 - t) * p2) + ((t - t2) * p3) / d32.
    
    B1 := ((t2 - t) * A1) + ((t     ) * A2) / t2.
    B2 := ((t3 - t) * A2) + ((t - t1) * A3) / d31.
    
    C  := ((t2 - t) * B1) + ((t - t1) * B2) / d21.
 
    aPath lineTo: C]

]

{ #category : #'geometry bounds' }
GsCatmullRomCurveGeometry >> geometryBounds: aBounds [
  ^ (aBounds rectangle: (self points
    ifEmpty: [ 0@0 extent: 0@0 ]
    ifNotEmpty: [ :thePoints |
      Rectangle encompassing: thePoints ]))
]

{ #category : #sparta }
GsCatmullRomCurveGeometry >> getT: t alpha: alpha p0: p0 p1: p1 [
  | d a b |
  d := p1 - p0.
  a := d dotProduct: d.
  b := a raisedTo: alpha * 0.5.
  ^ b + t.
]

{ #category : #initialization }
GsCatmullRomCurveGeometry >> initialize [
  super initialize.
  points := #().
  alpha := 0.5.
]

{ #category : #geometry }
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
