Trait {
	#name : #TK3StartNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'K3-Language'
}

{ #category : #generated }
TK3StartNodeVisitor >> visitBlock: aBlock [
	^ self visitStart: aBlock
]

{ #category : #generated }
TK3StartNodeVisitor >> visitCmdItem: aCmdItem [
	^ self visitStart: aCmdItem
]

{ #category : #generated }
TK3StartNodeVisitor >> visitCode: aCode [
	^ self visitStart: aCode
]

{ #category : #generated }
TK3StartNodeVisitor >> visitCodeItem: aCodeItem [
	^ self visitStart: aCodeItem
]

{ #category : #generated }
TK3StartNodeVisitor >> visitDef: aDef [
	^ self visitStart: aDef
]

{ #category : #generated }
TK3StartNodeVisitor >> visitExpr: anExpr [
	^ self visitStart: anExpr
]

{ #category : #generated }
TK3StartNodeVisitor >> visitLambda: aLambda [
	^ self visitStart: aLambda
]

{ #category : #generated }
TK3StartNodeVisitor >> visitLine: aLine [
	^ self visitStart: aLine
]

{ #category : #generated }
TK3StartNodeVisitor >> visitList: aList [
	^ self visitStart: aList
]

{ #category : #generated }
TK3StartNodeVisitor >> visitNumStrand: aNumStrand [
	^ self visitStart: aNumStrand
]

{ #category : #generated }
TK3StartNodeVisitor >> visitStart: aStart [
	^ self visitSmaCCParseNode: aStart
]

{ #category : #generated }
TK3StartNodeVisitor >> visitString: aString [
	^ self visitStart: aString
]

{ #category : #generated }
TK3StartNodeVisitor >> visitSymStrand: aSymStrand [
	^ self visitStart: aSymStrand
]
