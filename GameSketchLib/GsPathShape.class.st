"
I represent a chain of line segments and/or curves.

"
Class {
	#name : #GsPathShape,
	#superclass : #GsShape,
	#instVars : [
		'isClosed',
		'anchors'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsPathShape class >> newAtPoint: aPoint [
  ^ self new relocate: aPoint; addPoint: aPoint
]

{ #category : #accessing }
GsPathShape >> addPoint: aPoint [
  anchors add: aPoint.
  self rebuild
]

{ #category : #accessing }
GsPathShape >> at: anIndex [
  ^ anchors at: anIndex
]

{ #category : #accessing }
GsPathShape >> at: anIndex put: aPoint [
  anchors at: anIndex put: aPoint.
  self rebuild.
]

{ #category : #accessing }
GsPathShape >> gsHandles [
  ^ (1 to: anchors size) collect: [:i |
    self handleForPointAt: i]
]

{ #category : #accessing }
GsPathShape >> handleForLastPoint [
  ^ self handleForPointAt: anchors size
]

{ #category : #accessing }
GsPathShape >> handleForPointAt: anIndex [
  ^ GsHandle new for: self prop: (self propForPointAt: anIndex)
]

{ #category : #initialization }
GsPathShape >> initialize [
  super initialize.
  self size: 1@1;
       background: (Color white alpha: 0.5);
       clipChildren: false.
  anchors := OrderedCollection new
]

{ #category : #accessing }
GsPathShape >> moveAnchor: anIndex to: aPoint [
  anchors at: anIndex put: aPoint.
  self rebuild
]

{ #category : #accessing }
GsPathShape >> moveLastAnchor: aPoint [
  self moveAnchor: anchors size to: aPoint
]

{ #category : #accessing }
GsPathShape >> origin [
  ^ self position
]

{ #category : #accessing }
GsPathShape >> propForLatestPoint [
  ^ self propForPointAt: anchors size
]

{ #category : #accessing }
GsPathShape >> propForPointAt: anIndex [
  ^ GsAtIndexProp new target: self; index: anIndex
]

{ #category : #accessing }
GsPathShape >> rebuild [
  self removeChildren.
  (anchors size > 1) ifTrue: [|prev this|
    anchors do: [:each| 
      this := BlAbsolutePositionAnchor position: each - self origin.
      prev ifNotNil: [
        self addChild: (BlLineElement new
          border: Color black;
          fromAnchor: prev; toAnchor: this)].
      prev := this]]
]
