"
Storage for (v, hi, lo) triples.
The word ""base"" here means something like ""database"" rather than ""base class.""

"
Class {
	#name : #BexBase,
	#superclass : #Object,
	#instVars : [
		'vhlCache',
		'vhls',
		'vars'
	],
	#category : #'Bex-Debug-Bex-Debug'
}

{ #category : #accessing }
BexBase >> initialize [
  vhls := OrderedCollection new.
  vhlCache := Dictionary new.
  vars := OrderedCollection new.
]

{ #category : #accessing }
BexBase >> v: v hi: hi lo: lo [
  "ensure the triple exists in the base, and return its nid"
  |key|
  key :=  {v.hi.lo}.
  vhlCache at: key ifAbsentPut: [
    vhls add: key.
    vhls size ] 
]
