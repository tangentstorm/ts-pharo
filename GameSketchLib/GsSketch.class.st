"
I am a {{gtClass:GsGroup}} that  (in the future) can have attached scripts and be saved to disk. 
"
Class {
	#name : #GsSketch,
	#superclass : #GsObject,
	#category : #GameSketchLib
}

{ #category : #accessing }
GsSketch class >> fromJSON: aString [ 
  "build a scene from a json string"
  |items |  
  items := (STONJSON fromString: aString).
  items isArray ifFalse: [ self error: 'unable to parse scene from JSON' ].
  ^ self new addChildren: (items collect: [:item|
    item isDictionary ifFalse: [ self error: 'invalid item in scene: ', item toString].
    GsShape newFromData: item ]).
]

{ #category : #accessing }
GsSketch >> initialize [
  super initialize
]
