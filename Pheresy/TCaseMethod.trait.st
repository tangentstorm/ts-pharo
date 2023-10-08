Trait {
	#name : #TCaseMethod,
	#category : #'Pheresy-ControlFlow'
}

{ #category : #accessing }
TCaseMethod >> case: anObject of: assocs [
  assocs detect: [:kv| kv key = anObject or: [kv key isBlock and: [kv key value: anObject]]]
    ifFound: [:kv | ^ kv value value]
    ifNone: [^ nil]    
]
