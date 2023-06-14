Class {
	#name : #PileUpApp,
	#superclass : #Object,
	#instVars : [
		'db'
	],
	#category : #PileUp
}

{ #category : #accessing }
PileUpApp >> db [
	^ db
]

{ #category : #accessing }
PileUpApp >> db: anObject [
	db := anObject
]
