Class {
	#name : #GsButton,
	#superclass : #BrButton,
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsButton class >> accept [
  ^ self new
      addAptitude: BrGlamorousButtonWithIconAptitude new;
      icon: BrGlamorousVectorIcons accept
]
