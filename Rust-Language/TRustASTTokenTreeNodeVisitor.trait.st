Trait {
	#name : #TRustASTTokenTreeNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'Rust-Language'
}

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitBraceGroup: aBraceGroup [
	^ self visitTokenTree: aBraceGroup
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitBrackGroup: aBrackGroup [
	^ self visitTokenTree: aBrackGroup
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitComment: aComment [
	^ self visitTokenTree: aComment
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitNumber: aNumber [
	^ self visitTokenTree: aNumber
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitOther: anOther [
	^ self visitTokenTree: anOther
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitParenGroup: aParenGroup [
	^ self visitTokenTree: aParenGroup
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitString: aString [
	^ self visitTokenTree: aString
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitToken: aToken [
	^ self visitTokenTree: aToken
]

{ #category : #generated }
TRustASTTokenTreeNodeVisitor >> visitTokenTree: aTokenTree [
	^ self visitSmaCCParseNode: aTokenTree
]
