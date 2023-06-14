Trait {
	#name : #TK3StartNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'K3-Language'
}

{ #category : #generated }
TK3StartNodeVisitor >> visitAdverb: anAdverb [
	^ self visitStart: anAdverb
]

{ #category : #generated }
TK3StartNodeVisitor >> visitAssign: anAssign [
	^ self visitStart: anAssign
]

{ #category : #generated }
TK3StartNodeVisitor >> visitBlock: aBlock [
	^ self visitStart: aBlock
]

{ #category : #generated }
TK3StartNodeVisitor >> visitCall: aCall [
	^ self visitStart: aCall
]

{ #category : #generated }
TK3StartNodeVisitor >> visitChain: aChain [
	^ self visitStart: aChain
]

{ #category : #generated }
TK3StartNodeVisitor >> visitCode: aCode [
	^ self visitStart: aCode
]

{ #category : #generated }
TK3StartNodeVisitor >> visitDoStmt: aDoStmt [
	^ self visitStart: aDoStmt
]

{ #category : #generated }
TK3StartNodeVisitor >> visitIfStmt: anIfStmt [
	^ self visitStart: anIfStmt
]

{ #category : #generated }
TK3StartNodeVisitor >> visitLValue: aLValue [
	^ self visitStart: aLValue
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
TK3StartNodeVisitor >> visitNumArray: aNumArray [
	^ self visitStart: aNumArray
]

{ #category : #generated }
TK3StartNodeVisitor >> visitNumColon: aNumColon [
	^ self visitStart: aNumColon
]

{ #category : #generated }
TK3StartNodeVisitor >> visitNumber: aNumber [
	^ self visitStart: aNumber
]

{ #category : #generated }
TK3StartNodeVisitor >> visitPrim: aPrim [
	^ self visitStart: aPrim
]

{ #category : #generated }
TK3StartNodeVisitor >> visitSignature: aSignature [
	^ self visitStart: aSignature
]

{ #category : #generated }
TK3StartNodeVisitor >> visitStart: aStart [
	^ self visitSmaCCParseNode: aStart
]

{ #category : #generated }
TK3StartNodeVisitor >> visitStmts: aStmts [
	^ self visitStart: aStmts
]

{ #category : #generated }
TK3StartNodeVisitor >> visitString: aString [
	^ self visitStart: aString
]

{ #category : #generated }
TK3StartNodeVisitor >> visitSymArray: aSymArray [
	^ self visitStart: aSymArray
]

{ #category : #generated }
TK3StartNodeVisitor >> visitSymbol: aSymbol [
	^ self visitStart: aSymbol
]

{ #category : #generated }
TK3StartNodeVisitor >> visitWhileStmt: aWhileStmt [
	^ self visitStart: aWhileStmt
]
