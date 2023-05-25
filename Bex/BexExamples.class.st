Class {
	#name : #BexExamples,
	#superclass : #Object,
	#category : #Bex
}

{ #category : #accessing }
BexExamples >> abcXorAnd [
  <gtExample>
  "abstract syntax tree for (x0∧(x1≠x2))"
  ^ Bex and: {
	  Bex x: 0.
	  Bex xor: { Bex x:1. Bex x:2}}
]
