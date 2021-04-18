Trait {
	#name : #TRustASTSourceNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'Rust-Language'
}

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitBraceGroup: aBraceGroup [
	^ self visitSource: aBraceGroup
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitBrackGroup: aBrackGroup [
	^ self visitSource: aBrackGroup
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitInnerAttribute: anInnerAttribute [
	^ self visitSource: anInnerAttribute
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitItem: anItem [
	^ self visitSource: anItem
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitMacroInvocationSemi: aMacroInvocationSemi [
	^ self visitSource: aMacroInvocationSemi
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitMacroItem: aMacroItem [
	^ self visitSource: aMacroItem
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitOuterAttribute: anOuterAttribute [
	^ self visitSource: anOuterAttribute
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitParenGroup: aParenGroup [
	^ self visitSource: aParenGroup
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitSource: aSource [
	^ self visitSmaCCParseNode: aSource
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitToken: aToken [
	^ self visitSource: aToken
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitTokenTree: aTokenTree [
	^ self visitSource: aTokenTree
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitUseDeclaration: anUseDeclaration [
	^ self visitSource: anUseDeclaration
]

{ #category : #generated }
TRustASTSourceNodeVisitor >> visitVisItem: aVisItem [
	^ self visitSource: aVisItem
]
