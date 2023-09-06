Class {
	#name : #GsPathShape,
	#superclass : #GsShape,
	#instVars : [
		'points',
		'stroke',
		'origin',
		'isRebuilding',
		'start',
		'end'
	],
	#classInstVars : [
		'origin'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsPathShape class >> newAtPoint: aPoint [
  ^ self new relocate: aPoint.
]

{ #category : #accessing }
GsPathShape >> addPoint: aPoint [
  points add: aPoint.
  self rebuild
]

{ #category : #accessing }
GsPathShape >> addPoints: aCollection [
  points addAll: aCollection.
  self rebuild.
]

{ #category : #accessing }
GsPathShape >> at: anIndex [
  ^ points at: anIndex
]

{ #category : #accessing }
GsPathShape >> at: anIndex put: aPoint [
  points at: anIndex put: aPoint.
  self rebuild.
]

{ #category : #building }
GsPathShape >> buildVisuals: anElement [
  self border: BlBorder empty;
    background: BlTransparentBackground new.
  self background: (Color white alpha: 0.2).
  stroke := BlBorder builder 
    paint: anElement background paint color; build.
]

{ #category : #accessing }
GsPathShape >> end [
  "virtual point that mirrors the next to last point over the last point,
   unless you set it manually"
  | np |  np := points size.
  ^ end ifNil: [(points at: np) + ((points at: np)  - (points at: np-1))]
]

{ #category : #accessing }
GsPathShape >> end: anObject [
  end := anObject.
  self rebuild.
]

{ #category : #handles }
GsPathShape >> endHandle [
  |color| color := Color red darker.
  end ifNil: [color := color alpha: 0.4].
  ^ (GsHandle new for: self prop: self endProp)
    background: color
]

{ #category : #model }
GsPathShape >> endProp [
  ^ GsPointDescription new
    label: 'end';
    accessor: #end
]

{ #category : #shapes }
GsPathShape >> gsContainsPoint: aPoint [
  ^ self children anySatisfy: [:c|
    c geometry 
      containsPoint: aPoint - self position in: self.]
]

{ #category : #shapes }
GsPathShape >> gsCopy [
  "temp until the magritte way works"
  ^ self class new 
    gsPosition: self gsPosition; 
    addPoints: points copy
]

{ #category : #handles }
GsPathShape >> gsHandles [
  |innerHandles|
  innerHandles := ((1 to: points size) collect: [:i |
    self handleForPointAt: i]).
  ^ (innerHandles size > 1)
    ifTrue: [{self startHandle}, innerHandles, {self endHandle} ]
    ifFalse: [ innerHandles ]
]

{ #category : #handles }
GsPathShape >> handleForPointAt: anIndex [
  ^ GsHandle new for: self prop: (self propForPointAt: anIndex)
]

{ #category : #initialization }
GsPathShape >> initialize [
  super initialize.
  origin := 0@0.
  points := OrderedCollection new.
  isRebuilding := false.
  self when: BlElementPositionChangedEvent do: [:e|
    isRebuilding
      ifTrue: [ 
        self rebuildPath.         
        isRebuilding := false]
      ifFalse: [
        |diff | diff := self position - origin.
        points := points collect: [:p| p + diff]].
    origin := self position].
]

{ #category : #model }
GsPathShape >> propForPointAt: anIndex [
  ^ GsAtIndexProp new target: self; index: anIndex
]

{ #category : #rebuilding }
GsPathShape >> rebuild [
  self rebuildBounds.
  self rebuildPath.
]

{ #category : #rebuilding }
GsPathShape >> rebuildBounds [
  | rect |
  rect := Rectangle encompassing: points.
  (points size > 2) ifTrue: [
    rect := (rect encompass: self start) encompass: self end].
  "grow a bit for points close to the edge"
  rect := (rect expandBy: 10@10). 
  self size: rect extent.
  (rect topLeft ~= self position)
    ifTrue: [ isRebuilding := true. 
      self relocate: rect topLeft ]
]

{ #category : #rebuilding }
GsPathShape >> rebuildCatmullRom [
  |pts|  pts :=  points collect: [:p| p - origin].
  (pts size > 2) ifTrue: [
    pts := {self start - origin}, pts, {self end - origin}].
  self addChild: (GsCatmullRomCurveElement new 
    points: pts;
    border: stroke)
]

{ #category : #rebuilding }
GsPathShape >> rebuildPath [
  self removeChildren.
  "self rebuildPolyline."
  self rebuildCatmullRom
]

{ #category : #rebuilding }
GsPathShape >> rebuildPolyline [
  (points size > 1) ifTrue: [|prev this|
    points do: [:each| 
      this := BlAbsolutePositionAnchor position: each - self position.
      prev ifNotNil: [
        self addChild: (BlLineElement new
          border: stroke;
          fromAnchor: prev; toAnchor: this)].
      prev := this]]
]

{ #category : #accessing }
GsPathShape >> start [
  "virtual point that mirrors point 2 unless you move it manually"
  ^ start ifNil: [(points at: 1) - ((points at: 2)  - (points at: 1))]
]

{ #category : #accessing }
GsPathShape >> start: anObject [
  start := anObject.
  self rebuild
]

{ #category : #handles }
GsPathShape >> startHandle [
  | color | color := Color green darker.
  start ifNil: [color := color alpha: 0.2].
  ^ (GsHandle new for: self prop: self startProp)
    background: color
]

{ #category : #model }
GsPathShape >> startProp [
  ^ GsPointDescription new
    label: 'start';
    accessor: #start
]

{ #category : #accessing }
GsPathShape >> stroke: aBlBorder [
  stroke := aBlBorder
]
