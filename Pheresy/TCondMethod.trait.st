Trait {
	#name : #TCondMethod,
	#category : #'Pheresy-ControlFlow'
}

{ #category : #pheresy }
TCondMethod >> cond: anAssocArray [
  "Given an array of condition blocks associated with action blocks,
   perform the first action where the condition is true.
   The symbol '#else' can be used instead of the final condition
   to provide a default."
  anAssocArray detect: [:kv | kv key = #else or: kv key]
    ifFound: [:kv | ^ kv value value ]
    ifNone: [ ^ nil ]
]
