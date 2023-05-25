Class {
	#name : #BexVar,
	#superclass : #Bex,
	#instVars : [
		'vid'
	],
	#category : #Bex
}

{ #category : #accessing }
BexVar >> color [
  ^ Color fromHexString: '99ccff'
]

{ #category : #accessing }
BexVar >> printString [
  ^ 'x' , (vid asString)
]

{ #category : #accessing }
BexVar >> vid: aNat [
  vid := aNat
]
