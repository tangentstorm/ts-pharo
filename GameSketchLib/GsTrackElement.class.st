"
I am a {{gtClass:BlElement}} that displays information about a single {{gtClass:GsAnimationTrack}}.
I draw one row of the timeline in a {{gtClass:GsTimeline}}
"
Class {
	#name : #GsTrackElement,
	#superclass : #GsObject,
	#instVars : [
		'keyFrames',
		'trackH',
		'ghost',
		'track'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsTrackElement >> initialize [
  super initialize
    hMatchParent; vExact: (trackH := 20);
    when: BlMouseOverEvent do: [:e |
      |cw| cw := [self parent colW] onErrorDo: [20].
      ghost gsShow size: cw@trackH;
        relocate: ((e localPosition x / cw) floor * cw @0)];
    when: BlClickEvent do: [:e |
      self error: 'todo: add/remove keyframe'];
    when: BlMouseOutEvent do: [:e | ghost gsHide ].
]

{ #category : #accessing }
GsTrackElement >> redrawFrames [
  |cw| cw := [self parent colW] onErrorDo: [20].
  self removeChildren
    addChild: (ghost := BlElement new
        border: Color cyan; gsHide).
  track framesDo: [:i :v :t|
    self addChild: (GsObject new
      vMatchParent hExact: cw ;
      background: Color white;
      border: Color veryVeryDarkGray;
      relocate:  cw * i @ 0)].
]

{ #category : #accessing }
GsTrackElement >> track: aTrack [ 
  track := aTrack.
  self redrawFrames
]
