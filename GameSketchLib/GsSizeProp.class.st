Class {
	#name : #GsSizeProp,
	#superclass : #GsProp,
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsSizeProp >> read: aShape [
  ^ aShape extent
]

{ #category : #accessing }
GsSizeProp >> write: aSize to: aShape [
  aShape size: aSize
]
