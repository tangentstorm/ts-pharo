"
Drag any rectangle around to detect overlaps. Only the active rectangle (colored gold) is considered.

Double click background to create new rectangles.

"
Class {
	#name : #GsOverlapDemo,
	#superclass : #GsApp,
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
node := GsRectShape new size: 75@45;
  addEventHandler: BlPullHandler new;
  when: BlElementPositionChangedEvent do: [:e| |rect hits|
    rect := node bounds asRectangle.
    hits := 0.
    scene children copy
      remove: node;
      do: [:x| (rect intersects: x bounds asRectangle)
        ifTrue: [
          hits := hits + 1.
          x background: Color veryDarkGray] 
        ifFalse: [x background: Color white]].
    node background: (hits > 0
      ifTrue:[Color fromHexString: 'ffd700']
      ifFalse: [Color white])];
  when: BlMouseDownEvent do: [:e|
    current := node];
  when: BlDoubleClickEvent do: [:e|
    e consumed: true.
    node background: Color random].
^ current := node
]

{ #category : #accessing }
GsOverlapDemo >> makeStartScene [
  ^ GsScene new
    addChildren: {
      self makeNode relocate: 20@20.
      self makeNode relocate: 44@44.
      self makeNode relocate: 68@68.
      self makeNode relocate: 92@92};
    when: BlDoubleClickEvent do: [:e|
    	e consumed: true.
	    scene addChild: (self makeNode 
	     relocate: e localPosition - (5@5))].
]
