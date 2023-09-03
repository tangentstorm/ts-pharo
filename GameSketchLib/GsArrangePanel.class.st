Class {
	#name : #GsArrangePanel,
	#superclass : #GsDockable,
	#instVars : [
		'selection'
	],
	#category : #'GameSketchLib-UI - Panels'
}

{ #category : #accessing }
GsArrangePanel >> initialize [
  super initialize title: 'Arrange'.
  (GsSelection gtMethodsInClass & #gsArrangeCmd gtPragmas)
    contents do: [:method|
      workArea addChild: (BrButton new
        aptitude: BrGlamorousButtonWithLabelAptitude new;
        label: method selector;
        action: [selection perform: method selector])]
]

{ #category : #accessing }
GsArrangePanel >> selection: anObject [
  selection := anObject
]
