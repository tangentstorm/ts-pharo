Extension { #name : #OrderedDictionary }

{ #category : #'*GameSketchLib' }
OrderedDictionary >> sortKeys [
  orderedKeys := self keysSortedSafely asArray
]
