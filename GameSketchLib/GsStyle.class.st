"
I represent a named style in a scene.

"
Class {
	#name : #GsStyle,
	#superclass : #Object,
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsStyle class >> default [
^ BlCustomVisuals new
    background: Color white asBlBackground;
    border: Color black  asBlBorder
]
