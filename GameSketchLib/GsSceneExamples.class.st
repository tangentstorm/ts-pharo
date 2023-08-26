"
I provide example scenes for demos and tests.
"
Class {
	#name : #GsSceneExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsSceneExamples class >> allTheShapes [
  ^ GsSceneBuilder new
    circle: #c1 at: 250@250 radius: 90;
    rect: #r1 at: 250@250 size: 150@90 ;
    line: #l1 from: 200@200 to: 300@300;
    scene.
]

{ #category : #accessing }
GsSceneExamples class >> basicShapes [
  ^ GsScene fromJSON: '[
    {"id":"box", "t":"rect", "x":10, "y":10, "w":50, "h":30, "fg":"#333", "lw":2, "bg":"#c66"}]'
]

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
