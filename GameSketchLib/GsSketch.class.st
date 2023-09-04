"
I am a {{gtClass:GsGroup}} that  (in the future) can have attached scripts and be saved to disk. 
"
Class {
	#name : #GsSketch,
	#superclass : #GsShape,
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsSketch class >> fromJSON: aString [ 
  "build a scene from a json string"
  ^ GsJsonReader new read: aString
]
