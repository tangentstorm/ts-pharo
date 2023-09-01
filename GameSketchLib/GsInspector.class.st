Class {
	#name : #GsInspector,
	#superclass : #GsDockable,
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsInspector >> initialize [
  super initialize.
  self size: 150@250;
  title: 'Inspector'
]
