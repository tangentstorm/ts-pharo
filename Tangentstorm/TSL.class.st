"
Terrible Syntax Language?

A little builder class that's a bit like J/K/APL.

"
Class {
	#name : #TSL,
	#superclass : #Object,
	#category : #Tangentstorm
}

{ #category : #builder }
TSL class >> ! n [
	^ 0 to: n-1
]
