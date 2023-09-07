"
I am a {{gtClass:BlElement}} that displays information about a single {{gtClass:GsAnimationTrack}}.
I draw one row of the timeline in a {{gtClass:GsTimeline}}
"
Class {
	#name : #GsTrackElement,
	#superclass : #GsObject,
	#instVars : [
		'keyFrames',
		'trackH'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsTrackElement >> addFrames: aCollection [
  "should be list of key -> value associations"
  keyFrames addAll: aCollection.
  self redrawFrames
]

{ #category : #accessing }
GsTrackElement >> initialize [
  super initialize.
  self hMatchParent vExact: (trackH := 20).
  keyFrames := SortedCollection sortUsing: [:a :b |  a key < b key ].
]

{ #category : #accessing }
GsTrackElement >> redrawFrames [
  |cw| cw := [self parent colW] onErrorDo: [20].
  self removeChildren addChildren: (keyFrames collect: [:kv|
    GsObject new
      vMatchParent hExact: cw ;
      background: Color white;
      border: Color veryVeryDarkGray;
      relocate:  cw * kv key @ 0])
]
