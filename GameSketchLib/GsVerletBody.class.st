Class {
	#name : #GsVerletBody,
	#superclass : #GsPhysicsBody,
	#category : #'GameSketchLib-Physics'
}

{ #category : #accessing }
GsVerletBody >> stayInBounds: bxy [
  | px py vx vy bx by ox oy|
  px := pos x. py := pos y.
  vx := vel x. vy := vel y.
  bx := bxy x. by := bxy y.
  ox := old x . oy := old y.
  (py + radius > by) ifTrue: [ py := by-radius.   oy := py + vy].
  (py - radius < 0)  ifTrue: [ py := radius.      oy := py + vy].
  (px + radius > bx) ifTrue: [ px := bx-radius.   ox := px + vx].
  (px - radius < 0)  ifTrue: [ px := radius.      ox := px + vx].
  pos := px@py.  old := ox@oy.
]

{ #category : #accessing }
GsVerletBody >> step: dt [
  vel := pos - old.
  old := pos.
  pos := pos + vel + (acc * dt * dt).
]
