Class {
	#name : #GsStyle,
	#superclass : #Object,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsStyle class >> default [
^ BlCustomVisuals new
    background: Color white asBlBackground;
    border: Color black  asBlBorder
]
