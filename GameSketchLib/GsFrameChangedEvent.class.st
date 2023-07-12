"
I am sent by  {{gtClass:GsTimeline}} when its playhead moves to a new frame.
"
Class {
	#name : #GsFrameChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'frame'
	],
	#category : #GameSketchLib
}

{ #category : #accessing }
GsFrameChangedEvent >> frame [
	^ frame
]

{ #category : #accessing }
GsFrameChangedEvent >> frame: anObject [
	frame := anObject
]
