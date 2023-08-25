"
A trait to add to a BlElement to make it play nice with {{gtClass:GsSelectTool}} and  other tools.
"
Trait {
	#name : #TGsShaped,
	#instVars : [
		'shapePosition'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #'gsl - shapes' }
TGsShaped >> hide [
]

{ #category : #accessing }
TGsShaped >> shapeContainsPoint: p [
  "this implies that this trait is used on some kind of BlElement"
  ^ self bounds asRectangle containsPoint: p
]

{ #category : #accessing }
TGsShaped >> shapeHandles [
  "return a collection of handles."
  ^ { BlResizerElement new attachTo: self}
]

{ #category : #'gsl - shapes' }
TGsShaped >> shapePosition [
  ^ self position
]

{ #category : #'gsl - shapes' }
TGsShaped >> shapePosition: aPoint [
  "this has to be a separate interface from 'position', because shapes know where they are regardless of layout. See GsLineShape for extreme example."
  self relocate: (shapePosition := aPoint).
]

{ #category : #'gsl - shapes' }
TGsShaped >> show [
]
