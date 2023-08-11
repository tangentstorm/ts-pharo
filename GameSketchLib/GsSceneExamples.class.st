Class {
	#name : #GsSceneExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsSceneExamples class >> basicShapes [
  ^ GsSketch fromJSON: '[
    {"id":"box", "t":"rect", "x":10, "y":10, "w":50, "h":30, "fg":"#333", "lw":2, "bg":"#c66"}]'
]

{ #category : #initialization }
GsSceneExamples class >> nineSquares [
  | scene | 
  scene := GsSketch new.
  1 to: 3 do: [:j |
    1 to: 3 do: [:i |
      scene addChild: (GsCell new asElement
        relocate: (i*50)@(j*50))]].
  ^ scene
]
