"
Builder for scenes with a standard look and feel.
"
Class {
	#name : #TSScene,
	#superclass : #Object,
	#category : #Tangentstorm
}

{ #category : #builder }
TSScene class >> with: shapes [
  "build a scene with my usual styles"
  |c|
  c := RSCanvas new @ RSCanvasController; background: TSColors blueBg.
  c addAll: shapes.
  ^ c

]
