Class {
	#name : #GsInspector,
	#superclass : #GsDockable,
	#category : #'GameSketchLib-Apps'
}

{ #category : #accessing }
GsInspector >> initialize [
  super initialize.
  self size: 200@240;
  title: 'Inspector'
]

{ #category : #accessing }
GsInspector >> inspect: anObject [
  workArea removeChildren
    layout: BlLinearLayout vertical;
    addChild: (BrHorizontalPane new
      hMatchParent vFitContent
      alignCenterRight; 
      addChild: (BrButton new
        icon: BrGlamorousVectorIcons inspect;
        label: 'Inspect shape';
        aptitude: BrGlamorousButtonWithIconAptitude new;
        action: [:aButton | 
          aButton phlow spawnObject: anObject ] ));
    addChild: anObject asGtMagritteViewModel asElement
]

{ #category : #accessing }
GsInspector >> inspectSelection: selection [
  workArea removeChildren.  
  selection ifNotEmpty: [
    self inspect: selection first]
]
