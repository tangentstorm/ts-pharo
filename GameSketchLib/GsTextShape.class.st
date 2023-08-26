"
I represent a text string, rendered with a particular font at a particular location.

"
Class {
	#name : #GsTextShape,
	#superclass : #BrEditableLabel,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsTextShape >> gsHandles [
  self switchToEditor; requestFocus.
  ^ super gsHandles
]

{ #category : #accessing }
GsTextShape >> initialize [
  super initialize .
  self 
    aptitude: BrEditorAptitude new;
    fitContent;
    text: 'new text'
]
