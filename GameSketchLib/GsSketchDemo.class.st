Class {
	#name : #GsSketchDemo,
	#superclass : #GsApp,
	#category : #'GameSketchLib-Demos'
}

{ #category : #initialization }
GsSketchDemo >> initialize [
  super initialize.
  sceneHolder addChild: (GsSceneEditor for: scene)

]

{ #category : #initialization }
GsSketchDemo >> makeStartScene [
  scene := GsSketch new.
  1 to: 3 do: [:j |
    1 to: 3 do: [:i |
      scene addChild: (GsCell new asElement
        relocate: (i*50)@(j*50))]].
  ^ scene
]
