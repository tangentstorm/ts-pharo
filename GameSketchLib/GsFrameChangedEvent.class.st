"
I am sent by  {{gtClass:GsTimeline}} when its playhead moves to a new frame.
"
Class {
	#name : #GsFrameChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'frame',
		'oldFrame'
	],
	#category : #'GameSketchLib-Events'
}

{ #category : #accessing }
GsFrameChangedEvent >> frame [
	^ frame
]

{ #category : #accessing }
GsFrameChangedEvent >> frame: anObject [
	frame := anObject
]

{ #category : #events }
GsFrameChangedEvent >> old: frame0 new: frame1 [
  oldFrame := frame0.
  frame := frame1.
]
