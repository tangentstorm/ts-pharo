"
I represent a text string, rendered with a particular font at a particular location.

"
Class {
	#name : #GsTextShape,
	#superclass : #BrLabel,
	#traits : 'TGsShaped',
	#classTraits : 'TGsShaped classTrait',
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsTextShape >> initialize [
  super initialize .
  self 
    aptitude: BrGlamorousRegularEditorAptitude new;
    text: 'new text'
]

{ #category : #'gsl - shapes' }
GsTextShape >> shapeContainsPoint: p [
  "this implies that this trait is used on some kind of BlElement"
  ^ self bounds asRectangle containsPoint: p
]

{ #category : #accessing }
GsTextShape >> shapeHandles [
  self hide.
  ^ { BrEditableLabel new
    fitContent;
    aptitude: BrGlamorousRegularEditorAptitude new;
    relocate: self shapePosition;
	when: BrEditorAcceptWish
    do: [ :aWish | 
      self text: aWish text asString.
      self show];
    text: self text asString }
]
