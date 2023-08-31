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

{ #category : #accessing }
GsSceneExamples class >> spaceScene [
  <gtExample>
  ^ GsJsonReader read: self spaceSceneJson
]

{ #category : #accessing }
GsSceneExamples class >> spaceSceneJson [
  ^ '{"class":"GsScene", "fill":"#222222", "children":[
  {"class":"GsCircleShape", "fill":"#F7E26B", "center":"(715.8333333333334@264.0)", "radius":"124.91107948367824"},
  {"class":"GsCircleShape", "fill":"#9D9D9D", "center":"(805.9999999999999@268.33333333333337)", "radius":"20.833333333333325"},
  {"class":"GsCircleShape", "fill":"#31A2F2", "center":"(846.8333333333333@268.33333333333337)", "radius":"44.29227421972773"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(107.5@53.18290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(190.0@186.51623948415124)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(302.5@418.18290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(798.3333333333334@409.8495728174846)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(919.1666666666667@543.1829061508179)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(1198.3333333333335@391.51623948415124)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(1271.6666666666667@226.51623948415124)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(1175.8333333333335@168.18290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(571.6666666666667@95.68290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(513.3333333333334@194.84957281748456)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(513.3333333333334@318.18290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(538.3333333333334@480.68290615081787)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(415.83333333333337@533.1829061508179)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(238.33333333333337@558.1829061508179)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(165.83333333333334@389.01623948415124)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(1200.8333333333335@555.6829061508179)", "radius":"5"},
  {"class":"GsCircleShape", "fill":"#FFFFFF", "center":"(1331.6666666666667@439.01623948415124)", "radius":"5"}]}'
]
