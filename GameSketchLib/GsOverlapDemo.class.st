Class {
	#name : #GsOverlapDemo,
	#superclass : #GsToolApp,
	#instVars : [
		'current'
	],
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsOverlapDemo >> current [
	^ current
]

{ #category : #accessing }
GsOverlapDemo >> current: anObject [
	current := anObject
]

{ #category : #accessing }
GsOverlapDemo >> makeNode [
  |node|
node := BrVerticalPane new size: 75@45;
  background: Color white;
  addEventHandler: BlPullHandler new;
  when: BlDragEvent do: [:e| |rect hits|
    rect := node bounds asRectangle.
    hits := 0.
    scene children copy
      remove: node;
      do: [:x| (rect intersects: x bounds asRectangle)
        ifTrue: [
          hits := hits + 1.
          x background: Color black] 
        ifFalse: [x background: Color white]].
    node background: (hits > 0
      ifTrue:[Color fromHexString: 'ffd700']
      ifFalse: [Color white])];
  when: BlMouseDownEvent do: [:e|
    current := node];
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    node background: Color random].
^ node
]

{ #category : #accessing }
GsOverlapDemo >> makeStartScene [
  ^ GsScene new
    when: BlDoubleClickEvent do: [:e|
    	e consumed: true.
	    scene addChild: (current := self makeNode).
    	current relocate: e localPosition - (5@5)].
]
