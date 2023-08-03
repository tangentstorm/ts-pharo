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
  ^ GsSceneExamples nineSquares
]
