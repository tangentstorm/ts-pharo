Class {
	#name : #GsPhysicsTool,
	#superclass : #GsTool,
	#instVars : [
		'app'
	],
	#category : #'GameSketchLib-Physics'
}

{ #category : #accessing }
GsPhysicsTool >> app: anApp [
  app := anApp 
]

{ #category : #accessing }
GsPhysicsTool >> click: aPoint [
  app addBody: (
    GsVerletBody new
      pos: aPoint;
      shape: (sceneBuilder circle newAtPoint: aPoint; latestShape)).
]
