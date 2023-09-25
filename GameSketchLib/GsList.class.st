Class {
	#name : #GsList,
	#superclass : #OrderedCollection,
	#category : #'GameSketchLib-Lists'
}

{ #category : #accessing }
GsList >> asData [
  ^ (self collect: [:o | o id asSymbol]) asArray
]
