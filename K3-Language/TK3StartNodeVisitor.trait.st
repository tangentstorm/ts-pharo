Trait {
	#name : #TK3StartNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'K3-Language'
}

{ #category : #generated }
TK3StartNodeVisitor >> visitArray: anArray [
	^ self visitStart: anArray
]

{ #category : #generated }
TK3StartNodeVisitor >> visitStart: aStart [
	^ self visitSmaCCParseNode: aStart
]
