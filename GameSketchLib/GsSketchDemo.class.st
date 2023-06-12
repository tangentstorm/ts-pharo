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
 glass := GsObject new matchParentBounds;
   when: BlMouseDownEvent do: [:e|
    dragging := true.
    glass addChild: (selectangle
      relocate: (startPoint := e localPosition);
      size: 0@0)].

  glass when: BlMouseMoveEvent do: [:e| |p|
    p:= e localPosition rounded.
    coords text: (p asString, ' ',
      ((self childAtPoint: p) ifNil: ['']
        ifNotNil: #asString)) asRopedText.
    dragging ifTrue:[ |rect|
      rect := Rectangle 
        point: startPoint point: e localPosition.
      selectangle
        relocate: (rect topLeft);
        size: rect extent]].
   glass when: BlMouseUpEvent do: [:e| |rect|
     dragging := false.
     rect := selectangle bounds asRectangle.
     glass removeChildren.
     self selection: (scene children select: [:x|
       x bounds asRectangle intersects: rect])].
     
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
  glass addChildren: (selection collect: [:x| |rect|
    rect := x bounds asRectangle.
    BlElement new
      border: (BlBorder paint: Color cyan);
      background: (Color cyan alpha: 0.2);
      size: rect extent;
      relocate: rect topLeft])
]
