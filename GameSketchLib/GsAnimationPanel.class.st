Class {
	#name : #GsAnimationPanel,
	#superclass : #GsDockable,
	#instVars : [
		'timeline',
		'frameCounter',
		'playButton',
		'selection',
		'sketch'
	],
	#category : #'GameSketchLib-UI - Panels'
}

{ #category : #accessing }
GsAnimationPanel >> beDocked [
  super beDocked.
  self hMatchParent vExact: 120
]

{ #category : #accessing }
GsAnimationPanel >> beUndocked [
  super beUndocked.
  self hExact: 100.
]

{ #category : #accessing }
GsAnimationPanel >> initialize [
  super initialize title: 'Animation'; hExact: 200.  
  workArea addChild:
    (timeline := GsTimelineElement new)
]

{ #category : #ui }
GsAnimationPanel >> selection: aSelection [
  selection := aSelection
]

{ #category : #ui }
GsAnimationPanel >> sketch: aSketch [
  sketch := aSketch
]

{ #category : #initialization }
GsAnimationPanel >> timeline [
  ^ timeline
]
