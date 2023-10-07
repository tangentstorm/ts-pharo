Trait {
	#name : #TCaseMethod,
	#category : #'Pheresy-ControlFlow'
}

{ #category : #accessing }
TCaseMethod >> case: anObject of: assocs [
  assocs detect: [:kv| kv key = anObject ]
    ifFound: [:kv | ^ kv value value]
    ifNone: [^ nil]    
]
