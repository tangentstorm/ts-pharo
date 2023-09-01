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

{ #category : #accessing }
GsInspector >> inspect: anObject [
  workArea removeChildren
    addChild: anObject asGtMagritteViewModel asElement
]

{ #category : #accessing }
GsInspector >> inspectSelection: selection [
  workArea removeChildren.  
  selection ifNotEmpty: [
    self inspect: selection first]
]
