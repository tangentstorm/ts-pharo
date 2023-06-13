Class {
	#name : #GsSketchDemo,
	#superclass : #GsApp,
	#instVars : [
		'selectangle',
		'selection',
		'glass',
		'coords'
	],
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsSketchDemo >> childAtPoint: p [
  ^ scene allChildrenBreadthFirstDetect: [:x|
       x bounds asRectangle containsPoint: p]
     ifFound: #value
     ifNone: [nil].

]

{ #category : #initialization }
GsSketchDemo >> drawCoords: aPoint [
  coords text: (aPoint rounded asString, ' ',
    ((self childAtPoint: aPoint) ifNil: ['']
       ifNotNil: #asString)) asRopedText
]

{ #category : #initialization }
GsSketchDemo >> initialize [
  super initialize.
  sceneHolder addChild: self makeCoords.
  sceneHolder addChild: self makeGlass.

]

{ #category : #initialization }
GsSketchDemo >> makeCoords [
  coords := BlTextElement new text:'' asRopedText.
  coords relocate: 5@5.
  ^ coords
]

{ #category : #initialization }
GsSketchDemo >> makeGlass [
 | dragging startPoint|
 dragging := false.
 selectangle := BlElement new
   border: (BlBorder paint: Color cyan).
 glass := GsOverlay new
   onDragStart: [:p| glass addChild:(selectangle
     relocate:(startPoint := p); size:0@0)];
   onMouseMove: [:p| self drawCoords: p];
   onDrag: [:p| |rect| self drawCoords: p.
     rect := Rectangle point: startPoint point: p.
     selectangle
       relocate: rect topLeft; size: rect extent];
   onDragEnd: [:p| |rect|
     rect := selectangle bounds asRectangle.
     self selection: (scene children select: [:x|
       x bounds asRectangle intersects: rect])];
   onClick: [:p|
     self selection: (scene children select: [:x|
       x bounds asRectangle containsPoint: p])].
^ glass
]

{ #category : #initialization }
GsSketchDemo >> makeStartScene [
  scene := GsSketch new.
  1 to: 3 do: [:j |
    1 to: 3 do: [:i |
      scene addChild: (GsCell new asElement
        relocate: (i*50)@(j*50))]].
  ^ scene
]

{ #category : #accessing }
GsSketchDemo >> selection [
	^ selection
]

{ #category : #accessing }
GsSketchDemo >> selection: aCollection [
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
