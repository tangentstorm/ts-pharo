Class {
	#name : #RustASTVisItemNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'externTokens',
		'stringTokens',
		'unsafeTokens',
		'asyncToken',
		'constTokens',
		'fnTokens',
		'idenTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBraceTokens',
		'trees',
		'rightBraceTokens',
		'semicolonTokens',
		'whereToken',
		'commaTokens',
		'colonTokens',
		'lIFETIME_OR_LABELTokens',
		'_staticTokens',
		'__Tokens',
		'plusTokens',
		'forTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'implTokens',
		'questionMarkTokens',
		'dynTokens',
		'colonColonTokens',
		'bangTokens',
		'timesTokens',
		'mutTokens',
		'andTokens',
		'leftBracketTokens',
		'numberTokens',
		'rightBracketTokens',
		'_Tokens',
		'asTokens',
		'paths',
		'_LeftBracketTokens',
		'superTokens',
		'selfTokens',
		'crateTokens',
		'_crateTokens',
		'minusGreaterThanTokens',
		'equalTokens',
		'periodPeriodPeriodTokens',
		'boolTokens',
		'charTokens',
		'minusTokens',
		'periodPeriodEqualTokens',
		'refTokens',
		'periodPeriodTokens',
		'andAndTokens',
		'vis'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTVisItemNode >> _LeftBracketTokens [
	^ _LeftBracketTokens
]

{ #category : #generated }
RustASTVisItemNode >> _LeftBracketTokens: anOrderedCollection [
	_LeftBracketTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
RustASTVisItemNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> __Tokens [
	^ __Tokens
]

{ #category : #generated }
RustASTVisItemNode >> __Tokens: anOrderedCollection [
	__Tokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> _crateTokens [
	^ _crateTokens
]

{ #category : #generated }
RustASTVisItemNode >> _crateTokens: anOrderedCollection [
	_crateTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> _staticTokens [
	^ _staticTokens
]

{ #category : #generated }
RustASTVisItemNode >> _staticTokens: anOrderedCollection [
	_staticTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitVisItem: self
]

{ #category : #generated }
RustASTVisItemNode >> andAndTokens [
	^ andAndTokens
]

{ #category : #generated }
RustASTVisItemNode >> andAndTokens: anOrderedCollection [
	andAndTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> andTokens [
	^ andTokens
]

{ #category : #generated }
RustASTVisItemNode >> andTokens: anOrderedCollection [
	andTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
RustASTVisItemNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> asyncToken [
	^ asyncToken
]

{ #category : #generated }
RustASTVisItemNode >> asyncToken: aSmaCCToken [
	asyncToken := aSmaCCToken
]

{ #category : #generated }
RustASTVisItemNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
RustASTVisItemNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> boolTokens [
	^ boolTokens
]

{ #category : #generated }
RustASTVisItemNode >> boolTokens: anOrderedCollection [
	boolTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> charTokens [
	^ charTokens
]

{ #category : #generated }
RustASTVisItemNode >> charTokens: anOrderedCollection [
	charTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> colonColonTokens [
	^ colonColonTokens
]

{ #category : #generated }
RustASTVisItemNode >> colonColonTokens: anOrderedCollection [
	colonColonTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
RustASTVisItemNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
RustASTVisItemNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> compositeNodeVariables [
	^ #(#trees #attrs)
]

{ #category : #generated }
RustASTVisItemNode >> compositeTokenVariables [
	^ #(#externTokens #stringTokens #unsafeTokens #constTokens #fnTokens #idenTokens #leftParenTokens #rightParenTokens #leftBraceTokens #rightBraceTokens #semicolonTokens #commaTokens #colonTokens #lIFETIME_OR_LABELTokens #_staticTokens #__Tokens #plusTokens #forTokens #lessThanTokens #greaterThanTokens #implTokens #questionMarkTokens #dynTokens #colonColonTokens #bangTokens #timesTokens #mutTokens #andTokens #leftBracketTokens #numberTokens #rightBracketTokens #_Tokens #asTokens #_LeftBracketTokens #superTokens #selfTokens #crateTokens #_crateTokens #minusGreaterThanTokens #equalTokens #periodPeriodPeriodTokens #boolTokens #charTokens #minusTokens #periodPeriodEqualTokens #refTokens #periodPeriodTokens #andAndTokens)
]

{ #category : #generated }
RustASTVisItemNode >> constTokens [
	^ constTokens
]

{ #category : #generated }
RustASTVisItemNode >> constTokens: anOrderedCollection [
	constTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> crateTokens [
	^ crateTokens
]

{ #category : #generated }
RustASTVisItemNode >> crateTokens: anOrderedCollection [
	crateTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> dynTokens [
	^ dynTokens
]

{ #category : #generated }
RustASTVisItemNode >> dynTokens: anOrderedCollection [
	dynTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
RustASTVisItemNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> externTokens [
	^ externTokens
]

{ #category : #generated }
RustASTVisItemNode >> externTokens: anOrderedCollection [
	externTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> fnTokens [
	^ fnTokens
]

{ #category : #generated }
RustASTVisItemNode >> fnTokens: anOrderedCollection [
	fnTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> forTokens [
	^ forTokens
]

{ #category : #generated }
RustASTVisItemNode >> forTokens: anOrderedCollection [
	forTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
RustASTVisItemNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> idenTokens [
	^ idenTokens
]

{ #category : #generated }
RustASTVisItemNode >> idenTokens: anOrderedCollection [
	idenTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> implTokens [
	^ implTokens
]

{ #category : #generated }
RustASTVisItemNode >> implTokens: anOrderedCollection [
	implTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
RustASTVisItemNode >> initialize [
	super initialize.
	externTokens := OrderedCollection new: 2.
	stringTokens := OrderedCollection new: 2.
	unsafeTokens := OrderedCollection new: 2.
	constTokens := OrderedCollection new: 2.
	fnTokens := OrderedCollection new: 2.
	idenTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	trees := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	lIFETIME_OR_LABELTokens := OrderedCollection new: 2.
	_staticTokens := OrderedCollection new: 2.
	__Tokens := OrderedCollection new: 2.
	plusTokens := OrderedCollection new: 2.
	forTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	implTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	dynTokens := OrderedCollection new: 2.
	colonColonTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	timesTokens := OrderedCollection new: 2.
	mutTokens := OrderedCollection new: 2.
	andTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	numberTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	paths := OrderedCollection new: 2.
	_LeftBracketTokens := OrderedCollection new: 2.
	superTokens := OrderedCollection new: 2.
	selfTokens := OrderedCollection new: 2.
	crateTokens := OrderedCollection new: 2.
	_crateTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	boolTokens := OrderedCollection new: 2.
	charTokens := OrderedCollection new: 2.
	minusTokens := OrderedCollection new: 2.
	periodPeriodEqualTokens := OrderedCollection new: 2.
	refTokens := OrderedCollection new: 2.
	periodPeriodTokens := OrderedCollection new: 2.
	andAndTokens := OrderedCollection new: 2.
]

{ #category : #generated }
RustASTVisItemNode >> lIFETIME_OR_LABELTokens [
	^ lIFETIME_OR_LABELTokens
]

{ #category : #generated }
RustASTVisItemNode >> lIFETIME_OR_LABELTokens: anOrderedCollection [
	lIFETIME_OR_LABELTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
RustASTVisItemNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
RustASTVisItemNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
RustASTVisItemNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
RustASTVisItemNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
RustASTVisItemNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> minusTokens [
	^ minusTokens
]

{ #category : #generated }
RustASTVisItemNode >> minusTokens: anOrderedCollection [
	minusTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> mutTokens [
	^ mutTokens
]

{ #category : #generated }
RustASTVisItemNode >> mutTokens: anOrderedCollection [
	mutTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> numberTokens [
	^ numberTokens
]

{ #category : #generated }
RustASTVisItemNode >> numberTokens: anOrderedCollection [
	numberTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> otherVariables [
	^ #(#paths #vis #items)
]

{ #category : #generated }
RustASTVisItemNode >> paths [
	^ paths
]

{ #category : #generated }
RustASTVisItemNode >> paths: anOrderedCollection [
	self setParent: self paths to: nil.
	paths := anOrderedCollection.
	self setParent: self paths to: self
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodEqualTokens [
	^ periodPeriodEqualTokens
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodEqualTokens: anOrderedCollection [
	periodPeriodEqualTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodTokens [
	^ periodPeriodTokens
]

{ #category : #generated }
RustASTVisItemNode >> periodPeriodTokens: anOrderedCollection [
	periodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> plusTokens [
	^ plusTokens
]

{ #category : #generated }
RustASTVisItemNode >> plusTokens: anOrderedCollection [
	plusTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
RustASTVisItemNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> refTokens [
	^ refTokens
]

{ #category : #generated }
RustASTVisItemNode >> refTokens: anOrderedCollection [
	refTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
RustASTVisItemNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
RustASTVisItemNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
RustASTVisItemNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
RustASTVisItemNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
RustASTVisItemNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> stringTokens [
	^ stringTokens
]

{ #category : #generated }
RustASTVisItemNode >> stringTokens: anOrderedCollection [
	stringTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> superTokens [
	^ superTokens
]

{ #category : #generated }
RustASTVisItemNode >> superTokens: anOrderedCollection [
	superTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> timesTokens [
	^ timesTokens
]

{ #category : #generated }
RustASTVisItemNode >> timesTokens: anOrderedCollection [
	timesTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> tokenVariables [
	^ #(#asyncToken #whereToken #shebang)
]

{ #category : #generated }
RustASTVisItemNode >> trees [
	^ trees
]

{ #category : #generated }
RustASTVisItemNode >> trees: anOrderedCollection [
	self setParents: self trees to: nil.
	trees := anOrderedCollection.
	self setParents: self trees to: self
]

{ #category : #generated }
RustASTVisItemNode >> unsafeTokens [
	^ unsafeTokens
]

{ #category : #generated }
RustASTVisItemNode >> unsafeTokens: anOrderedCollection [
	unsafeTokens := anOrderedCollection
]

{ #category : #generated }
RustASTVisItemNode >> vis [
	^ vis
]

{ #category : #generated }
RustASTVisItemNode >> vis: anObject [
	self setParent: self vis to: nil.
	vis := anObject.
	self setParent: self vis to: self
]

{ #category : #generated }
RustASTVisItemNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
RustASTVisItemNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
