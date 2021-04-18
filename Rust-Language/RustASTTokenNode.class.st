Class {
	#name : #RustASTTokenNode,
	#superclass : #RustASTSourceNode,
	#instVars : [
		'commentToken',
		'stringToken',
		'charToken',
		'numberToken',
		'idenToken',
		'otherToken',
		'bangToken',
		'_Token',
		'percentToken',
		'upArrowToken',
		'andToken',
		'andAndToken',
		'timesToken',
		'orToken',
		'periodToken',
		'commaToken',
		'semicolonToken',
		'colonToken',
		'colonColonToken',
		'__Token',
		'lessThanToken',
		'greaterThanToken',
		'minusGreaterThanToken',
		'plusToken',
		'equalToken',
		'minusToken',
		'asToken',
		'asyncToken',
		'constToken',
		'crateToken',
		'externToken',
		'fnToken',
		'forToken',
		'inToken',
		'letToken',
		'modToken',
		'mutToken',
		'pubToken',
		'selfToken',
		'_staticToken',
		'staticToken',
		'superToken',
		'unsafeToken',
		'useToken',
		'whileToken'
	],
	#category : #'Rust-Language'
}

{ #category : #generated }
RustASTTokenNode >> _Token [
	^ _Token
]

{ #category : #generated }
RustASTTokenNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> __Token [
	^ __Token
]

{ #category : #generated }
RustASTTokenNode >> __Token: aSmaCCToken [
	__Token := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> _staticToken [
	^ _staticToken
]

{ #category : #generated }
RustASTTokenNode >> _staticToken: aSmaCCToken [
	_staticToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> acceptVisitor: aSourceVisitor [
	^ aSourceVisitor visitToken: self
]

{ #category : #generated }
RustASTTokenNode >> andAndToken [
	^ andAndToken
]

{ #category : #generated }
RustASTTokenNode >> andAndToken: aSmaCCToken [
	andAndToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> andToken [
	^ andToken
]

{ #category : #generated }
RustASTTokenNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> asToken [
	^ asToken
]

{ #category : #generated }
RustASTTokenNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> asyncToken [
	^ asyncToken
]

{ #category : #generated }
RustASTTokenNode >> asyncToken: aSmaCCToken [
	asyncToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> bangToken [
	^ bangToken
]

{ #category : #generated }
RustASTTokenNode >> bangToken: aSmaCCToken [
	bangToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> charToken [
	^ charToken
]

{ #category : #generated }
RustASTTokenNode >> charToken: aSmaCCToken [
	charToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
RustASTTokenNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
RustASTTokenNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
RustASTTokenNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken [
	^ commentToken
]

{ #category : #generated }
RustASTTokenNode >> commentToken: aSmaCCToken [
	commentToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> constToken [
	^ constToken
]

{ #category : #generated }
RustASTTokenNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> crateToken [
	^ crateToken
]

{ #category : #generated }
RustASTTokenNode >> crateToken: aSmaCCToken [
	crateToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
RustASTTokenNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> externToken [
	^ externToken
]

{ #category : #generated }
RustASTTokenNode >> externToken: aSmaCCToken [
	externToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> fnToken [
	^ fnToken
]

{ #category : #generated }
RustASTTokenNode >> fnToken: aSmaCCToken [
	fnToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> forToken [
	^ forToken
]

{ #category : #generated }
RustASTTokenNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
RustASTTokenNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken [
	^ idenToken
]

{ #category : #generated }
RustASTTokenNode >> idenToken: aSmaCCToken [
	idenToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> inToken [
	^ inToken
]

{ #category : #generated }
RustASTTokenNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
RustASTTokenNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> letToken [
	^ letToken
]

{ #category : #generated }
RustASTTokenNode >> letToken: aSmaCCToken [
	letToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> minusGreaterThanToken [
	^ minusGreaterThanToken
]

{ #category : #generated }
RustASTTokenNode >> minusGreaterThanToken: aSmaCCToken [
	minusGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> minusToken [
	^ minusToken
]

{ #category : #generated }
RustASTTokenNode >> minusToken: aSmaCCToken [
	minusToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> modToken [
	^ modToken
]

{ #category : #generated }
RustASTTokenNode >> modToken: aSmaCCToken [
	modToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> mutToken [
	^ mutToken
]

{ #category : #generated }
RustASTTokenNode >> mutToken: aSmaCCToken [
	mutToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
RustASTTokenNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> orToken [
	^ orToken
]

{ #category : #generated }
RustASTTokenNode >> orToken: aSmaCCToken [
	orToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken [
	^ otherToken
]

{ #category : #generated }
RustASTTokenNode >> otherToken: aSmaCCToken [
	otherToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> percentToken [
	^ percentToken
]

{ #category : #generated }
RustASTTokenNode >> percentToken: aSmaCCToken [
	percentToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
RustASTTokenNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> plusToken [
	^ plusToken
]

{ #category : #generated }
RustASTTokenNode >> plusToken: aSmaCCToken [
	plusToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> pubToken [
	^ pubToken
]

{ #category : #generated }
RustASTTokenNode >> pubToken: aSmaCCToken [
	pubToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> selfToken [
	^ selfToken
]

{ #category : #generated }
RustASTTokenNode >> selfToken: aSmaCCToken [
	selfToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
RustASTTokenNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
RustASTTokenNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
RustASTTokenNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> superToken [
	^ superToken
]

{ #category : #generated }
RustASTTokenNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
RustASTTokenNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> tokenVariables [
	^ #(#commentToken #stringToken #charToken #numberToken #idenToken #otherToken #bangToken #_Token #percentToken #upArrowToken #andToken #andAndToken #timesToken #orToken #periodToken #commaToken #semicolonToken #colonToken #colonColonToken #__Token #lessThanToken #greaterThanToken #minusGreaterThanToken #plusToken #equalToken #minusToken #asToken #asyncToken #constToken #crateToken #externToken #fnToken #forToken #inToken #letToken #modToken #mutToken #pubToken #selfToken #_staticToken #staticToken #superToken #unsafeToken #useToken #whileToken #shebang)
]

{ #category : #generated }
RustASTTokenNode >> unsafeToken [
	^ unsafeToken
]

{ #category : #generated }
RustASTTokenNode >> unsafeToken: aSmaCCToken [
	unsafeToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> upArrowToken [
	^ upArrowToken
]

{ #category : #generated }
RustASTTokenNode >> upArrowToken: aSmaCCToken [
	upArrowToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> useToken [
	^ useToken
]

{ #category : #generated }
RustASTTokenNode >> useToken: aSmaCCToken [
	useToken := aSmaCCToken
]

{ #category : #generated }
RustASTTokenNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
RustASTTokenNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
