"
I am a builder for {{gtClass:GsSetter}} subclasses.

example usage:
```
GsSetterKinds setterFor: #position
```

"
Class {
	#name : #GsSetterKinds,
	#superclass : #Object,
	#category : #'GameSketchLib-Setters'
}

{ #category : #registry }
GsSetterKinds class >> position [
  ^ GsPositionSetter
]

{ #category : #registry }
GsSetterKinds class >> rotation [
  ^ GsRotationSetter
]

{ #category : #registry }
GsSetterKinds class >> setterFor: aSlotName [
  "send message name as symbol"
  ^ self perform: aSlotName
]
