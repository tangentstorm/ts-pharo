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
    addChild: self vDock as: #leftDock;
    addChild: (BrVerticalPane new matchParent
      addChild: anElement matchParent as: #content;
      addChild: self hDock as: #bottomDock);
    addChild: self vDock as: #rightDock
]

{ #category : #creating }
GsDockContainer class >> hDock [
  ^ BrHorizontalPane new vFitContent hMatchParent
]

{ #category : #creating }
GsDockContainer class >> new [
  self error: 'Use around: aWidget to create a Dock Container'
]

{ #category : #creating }
GsDockContainer class >> vDock [
  ^ BrVerticalPane new hFitContent vMatchParent
]

{ #category : #accessing }
GsDockContainer >> addDockable: aDockable [
  self addChild: aDockable.
  aDockable dockContainer: self.
]

{ #category : #accessing }
GsDockContainer >> addDockable: aDockable as: aSymbol [
  self addDockable: aDockable.
  aDockable id: aSymbol
]

{ #category : #accessing }
GsDockContainer >> addDockable: aDockable as: aSymbol in: aDockId [
  self addDockable: aDockable as: aSymbol.
  aDockable dockIn: aDockId.
]
