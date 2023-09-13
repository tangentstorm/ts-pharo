Class {
	#name : #GsEulerBody,
	#superclass : #GsPhysicsBody,
	#category : #'GameSketchLib-Physics'
}

{ #category : #accessing }
GsEulerBody >> stayInBounds: aPoint [
  | px py vx vy bx by|
  px := pos x. py := pos y.
  vx := vel x. vy := vel y.
  bx := aPoint x. by := aPoint y.
  (py + radius > by) ifTrue: [ py := by-radius.  vy := 0 -vy].
  (py - radius < 0)   ifTrue: [ py := radius.   vy := 0 -vy].
  (px + radius > bx) ifTrue: [ px := by -radius.  vx := 0 -vx].
  (px - radius < 0)   ifTrue: [ px := radius.   vx := 0 -vx].
  pos := px@py.  vel := vx@vy.
]

{ #category : #accessing }
GsEulerBody >> step: dt [
  vel := vel + (acc * dt).
  pos := pos + vel.
]
