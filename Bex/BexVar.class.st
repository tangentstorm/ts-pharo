Class {
	#name : #BexVar,
	#superclass : #Bex,
	#instVars : [
		'vid'
	],
	#category : #Bex
}

{ #category : #accessing }
BexVar >> nodeString [
  ^ 'x' , (vid asString)
]

{ #category : #accessing }
BexVar >> vid: aNat [
  vid := aNat
]
