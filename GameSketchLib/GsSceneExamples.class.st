Class {
	#name : #GsSceneExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #initialization }
GsSceneExamples class >> nineSquares [
  | scene | 
  scene := GsScene new.
  1 to: 3 do: [:j |
    1 to: 3 do: [:i |
      scene addChild: (GsCell new asElement
        relocate: (i*50)@(j*50))]].
  ^ scene
]
