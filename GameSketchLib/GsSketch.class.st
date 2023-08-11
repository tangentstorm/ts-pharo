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
GsSketch >> circle: aName at: aPoint radius: aRadius [
  self addChild: (GsCircleShape new 
  		relocate: aPoint - (aRadius asPoint/2);
  		r: aRadius )
  	 as: aName
]

{ #category : #accessing }
GsSketch >> initialize [
  super initialize matchParent background: GsColor defaultBg
]

{ #category : #accessing }
GsSketch >> rect: aName at: aPoint size: aSize [
  self addChild: (GsRectShape new relocate: aPoint; size: aSize) as: aName
]

{ #category : #accessing }
GsSketch >> square: aString at: anObject size: anObject1 [ 
]
