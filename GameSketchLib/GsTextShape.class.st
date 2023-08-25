"
I represent a text string, rendered with a particular font at a particular location.

"
Class {
	#name : #GsTextShape,
	#superclass : #BrEditableLabel,
	#traits : 'TGsShaped',
	#classTraits : 'TGsShaped classTrait',
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsTextShape >> initialize [
  super initialize .
  self 
    aptitude: BrEditorAptitude new;
    fitContent;
    text: 'new text'
]

{ #category : #'gsl - shapes' }
GsTextShape >> shapeContainsPoint: p [
  "this implies that this trait is used on some kind of BlElement"
  ^ self bounds asRectangle containsPoint: p
]

{ #category : #accessing }
GsTextShape >> shapeHandles [
  self switchToEditor; requestFocus.
  ^ { BlResizerElement new attachTo: self }
]
