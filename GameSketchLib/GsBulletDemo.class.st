Class {
	#name : #GsBulletDemo,
	#superclass : #GsApp,
	#instVars : [
		'bullets',
		'ammoClip'
	],
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsBulletDemo >> makeBullet [
  ^ GsBullet new .

]

{ #category : #accessing }
GsBulletDemo >> makeStartScene [
  |s|
  s := GsSketch new.
  ammoClip := BrHorizontalPane new 
    cellSpacing: 5; relocate: 0@5.
  bullets := (1 to: 3) collect: [:i| self makeBullet].
  s addChild: (ammoClip addChildren: bullets; fitContent).
  s when: BlMouseDownEvent do: [:e| |b|
    ammoClip children ifNotEmpty: [
      b := (ammoClip children last).
      ammoClip removeChild: b.
      s addChild: b.
      b relocate: e localPosition;
        fire;
        enqueueTask: (BlRepeatedTaskAction new delay: 0;
          action: [:t|
            b relocate: (b position + (0@ -7)).
            b position y < 0 ifTrue: [
              t stop.
              s removeChild: b.
              ammoClip addChild: b. ]])]].
  ^ s
]
