Class {
	#name : #GsInspector,
	#superclass : #GsDockable,
	#category : #'GameSketchLib-UI - Panels'
}

{ #category : #accessing }
GsInspector >> initialize [
  super initialize title: 'Inspector'
]

{ #category : #accessing }
GsInspector >> inspect: anObject [
  workArea removeChildren
    layout: BlLinearLayout vertical;
    addChild: (BrHorizontalPane new
      hMatchParent vFitContent
      alignCenterRight;
      addChildren: anObject gsInspectorButtons);
    addChild: anObject asGtMagritteViewModel asElement
]

{ #category : #accessing }
GsInspector >> inspectSelection: selection [
  workArea removeChildren.  
  selection ifNotEmpty: [
    self inspect: selection first]
]
