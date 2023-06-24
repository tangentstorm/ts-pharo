Class {
	#name : #PileUpApp,
	#superclass : #GsApp,
	#instVars : [
		'db',
		'homeId'
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

{ #category : #accessing }
PileUpApp >> getPileById: aCouchId [
  | items inScene pile |
  pile := db get: aCouchId.
  pile at: 'items' put: (items := (db find: {'pile' -> aCouchId}) at: 'docs').

  "anything not in scene is an inbox scrap"
  inScene := ((pile at: 'scene' ifAbsentPut: [ self newDefaultScene ])
  		collect: [ :d | (d at: '_id') -> d]) asDictionary.

  "add a fake model for the link back to the home pile (if present),
   so we can display its text"
  (aCouchId ~= homeId) ifTrue: [
     inScene at: homeId at: 'o' put: ({'text' -> homeId} asDictionary)].

  "left join scene with items."
  items do: [ :d |
    inScene at: (d at: '_id') ifPresent: [ :sceneData |
      sceneData at: 'o' put: d ] ].
	  
  ^ pile
]

{ #category : #accessing }
PileUpApp >> initialize [
  super initialize.
  homeId := '@home'.
]
