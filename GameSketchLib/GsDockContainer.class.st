"
I have left and right areas to hold {{gtClass:GsDockable}} panels.
"
Class {
	#name : #GsDockContainer,
	#superclass : #GsObject,
	#category : #'GameSketchLib-UI - Docking'
}

{ #category : #creating }
GsDockContainer class >> around: anElement [
  ^ self basicNew initialize matchParent
    layout: BlLinearLayout horizontal;
    "aptitude: BrLayoutAlignmentStatelessAptitude new"
    addChild: self newDock as: #leftDock;
    addChild: anElement matchParent as: #content;
    addChild: self newDock as: #rightDock
]

{ #category : #creating }
GsDockContainer class >> new [
  self error: 'Use around: aWidget to create a Dock Container'
]

{ #category : #creating }
GsDockContainer class >> newDock [
  ^ BrVerticalPane new hFitContent vMatchParent
]
