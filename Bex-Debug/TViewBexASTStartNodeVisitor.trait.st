Trait {
	#name : #TViewBexASTStartNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'Bex-Debug'
}

{ #category : #generated }
TViewBexASTStartNodeVisitor >> visitRef: aRef [
	^ self visitStart: aRef
]

{ #category : #generated }
TViewBexASTStartNodeVisitor >> visitRow: aRow [
	^ self visitStart: aRow
]

{ #category : #generated }
TViewBexASTStartNodeVisitor >> visitStart: aStart [
	^ self visitSmaCCParseNode: aStart
]
