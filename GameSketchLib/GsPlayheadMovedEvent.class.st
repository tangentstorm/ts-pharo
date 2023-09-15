"
I am sent by  {{gtClass:GsTimelineElement}} when its playhead moves to a new frame.

"
Class {
	#name : #GsPlayheadMovedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'frame',
		'oldFrame'
	],
	#category : #'GameSketchLib-Events'
}

{ #category : #accessing }
GsPlayheadMovedEvent >> frame [
	^ frame
]

{ #category : #accessing }
GsPlayheadMovedEvent >> frame: anObject [
	frame := anObject
]

{ #category : #events }
GsPlayheadMovedEvent >> old: frame0 new: frame1 [
  oldFrame := frame0.
  frame := frame1.
]
