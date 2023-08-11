Class {
	#name : #GsSceneEditor,
	#superclass : #GsObject,
	#instVars : [
		'glass',
		'selectangle',
		'selection',
		'coords',
		'scene'
	],
	#category : #'GameSketchLib-SceneEditor'
}

{ #category : #initialization }
GsSceneEditor class >> for: aGsScene [ 
  ^ self new scene: aGsScene
]

{ #category : #accessing }
GsSceneEditor >> childAtPoint: p [
  ^ scene allChildrenBreadthFirstDetect: [:x|
       x bounds asRectangle containsPoint: p]
     ifFound: #value
     ifNone: [nil]. 

]

{ #category : #initialization }
GsSceneEditor >> drawCoords: aPoint [
  coords text: (aPoint rounded asString, ' ', 
    ((self childAtPoint: aPoint) ifNil: ['']
       ifNotNil: #asString)) asRopedText
]

{ #category : #initialization }
GsSceneEditor >> initialize [
  super initialize.
  scene := GsSketch new.
  self matchParent.
  self addChild: self makeGlass.
  self addChild: self makeCoords.
]

{ #category : #initialization }
GsSceneEditor >> makeCoords [
  coords := BlTextElement new text:'' asRopedText.
  coords relocate: 5@5.
  ^ coords
]

{ #category : #initialization }
GsSceneEditor >> makeGlass [
 | startPoint target|
 selectangle := BlElement new
   border: (BlBorder paint: Color cyan).
 glass := GsOverlay new
   onDragStart: [:p| startPoint := p.
    (target := scene childAtPoint: p)
      ifNil: [glass addChild:
        (selectangle relocate:p; size:0@0)]
      ifNotNil: [startPoint := target position-p]];
   onMouseMove: [:p| self drawCoords: p];
   onDrag: [:p| |rect| self drawCoords: p.
     target ifNil: [
       rect := Rectangle point: startPoint point: p.
       selectangle relocate: rect topLeft; size: rect extent]
     ifNotNil: [target relocate: p + startPoint]];
   onDragEnd: [:p| |rect|
     target ifNil: [
       rect := selectangle bounds asRectangle.
       self selection: (scene children select: [:x|
         x bounds asRectangle intersects: rect])]];
   onClick: [:p| self selection:
     ((scene childAtPoint: p) ifNil:[{}] ifNotNil:[:x|{x}])].
^ glass
]

{ #category : #accessing }
GsSceneEditor >> scene: aGsScene [ 
  scene := aGsScene
]

{ #category : #accessing }
GsSceneEditor >> selection [
	^ selection
]

{ #category : #accessing }
GsSceneEditor >> selection: aCollection [
  selection := aCollection asArray.
  glass removeChildren.
  glass addChildren: (selection collect: [:x| |rect|
    rect := x bounds asRectangle.
    BlElement new
      border: (BlBorder paint: Color cyan);
      background: (Color cyan alpha: 0.2);
      size: rect extent;
      relocate: rect topLeft])
]
