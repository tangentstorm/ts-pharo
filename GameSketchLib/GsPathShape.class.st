Class {
	#name : #GsPathShape,
	#superclass : #GsShape,
	#instVars : [
		'points',
		'stroke',
		'origin',
		'isRebuilding'
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

{ #category : #accessing }
GsPathShape >> buildVisuals: anElement [
  self border: BlBorder empty;
    background: BlTransparentBackground new.
  stroke := BlBorder builder 
    paint: anElement background paint color; build.
]

{ #category : #accessing }
GsPathShape >> gsContainsPoint: aPoint [
  ^ self children anySatisfy: [:c|
    c geometry 
      containsPoint: aPoint - self position in: self.]
]

{ #category : #accessing }
GsPathShape >> gsCopy [
  "temp until the magritte way works"
  ^ self class new 
    gsPosition: self gsPosition; 
    addPoints: points copy
]

{ #category : #accessing }
GsPathShape >> gsHandles [
  ^ (1 to: points size) collect: [:i |
    self handleForPointAt: i]
]

{ #category : #accessing }
GsPathShape >> handleForPointAt: anIndex [
  ^ GsHandle new for: self prop: (self propForPointAt: anIndex)
]

{ #category : #initialization }
GsPathShape >> initialize [
  super initialize.
  origin := 0@0.
  points := OrderedCollection new.
  stroke := BlBorder builder paint: Color black; build.
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

{ #category : #accessing }
GsPathShape >> propForPointAt: anIndex [
  ^ GsAtIndexProp new target: self; index: anIndex
]

{ #category : #accessing }
GsPathShape >> rebuild [
  self rebuildBounds.
  self rebuildPath.
]

{ #category : #accessing }
GsPathShape >> rebuildBounds [
  | rect |
  rect := Rectangle encompassing: points.
  self size: rect extent.
  (rect topLeft ~= self position)
    ifTrue: [ isRebuilding := true. 
      self relocate: rect topLeft ]
]

{ #category : #accessing }
GsPathShape >> rebuildPath [
  self removeChildren.
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
GsPathShape >> strokeColor: aColor [ 
  strokeColor := aColor
]
