Class {
	#name : #RustScanner,
	#superclass : #SmaCCScanner,
	#category : #'Rust-Language'
}

{ #category : #'generated-initialization' }
RustScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(67 '''_' 8) #(67 '''static' 9) #(68 'Self' 29) #(68 'as' 34) #(68 'async' 35) #(68 'const' 36) #(68 'crate' 37) #(68 'dyn' 38) #(68 'extern' 39) #(68 'false' 63) #(68 'fn' 40) #(68 'for' 41) #(68 'impl' 42) #(68 'in' 43) #(68 'let' 44) #(68 'macro_rules' 45) #(68 'mod' 46) #(68 'mut' 47) #(68 'pub' 48) #(68 'ref' 49) #(68 'self' 50) #(68 'static' 51) #(68 'super' 52) #(68 'true' 63) #(68 'unsafe' 53) #(68 'use' 54) #(68 'where' 55) #(68 'while' 56))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
RustScanner >> emptySymbolTokenId [
	^ 228
]

{ #category : #generated }
RustScanner >> errorTokenId [
	^ 229
]

{ #category : #generated }
RustScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(64).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			currentCharacter == $\
				ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan1
]

{ #category : #generated }
RustScanner >> scan3 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1 69) ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(5 69) ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(12 69) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(13 69) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(14 69) ].
	^ self scanForTokenX14
]

{ #category : #generated }
RustScanner >> scanForTokenX1 [
	self recordMatch: #(69).
	self step.
	currentCharacter == $!
		ifTrue: [ self step.
			currentCharacter == $!
				ifTrue: [ [ self recordMatch: #(62).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			^ self reportLastMatch ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX10 [
	self recordMatch: #(15 69).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX11 [
	self recordMatch: #(6 69).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX12 [
	[ self recordMatch: #(66).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX13 [
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(32 69) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(57) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(58 69) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX12 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX8 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue:
			[ self scanForTokenX5 ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX14 [
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(23 69) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(24 69) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(25 69) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(26 69) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(27 69) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(28 69) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self scanForTokenX13
]

{ #category : #generated }
RustScanner >> scanForTokenX2 [
	self recordMatch: #(69).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ self recordMatch: #(67).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ [ self recordMatch: #(67).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	true
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(65) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX3 [
	self recordMatch: #(69).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(60).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX4 [
	self recordMatch: #(33 68).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(68).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX5 [
	[ self recordMatch: #(68).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
RustScanner >> scanForTokenX6 [
	self recordMatch: #(17 69).
	self step.
	currentCharacter == $.
		ifTrue: [ self recordMatch: #(18).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(20) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX7 [
	self recordMatch: #(69).
	self step.
	currentCharacter == $c
		ifTrue: [ (self scanForString: 'rate')
				ifTrue: [ ^ self recordAndReportMatch: #(4) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX8 [
	[ self recordMatch: #(61).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX9 [
	self recordMatch: #(21 69).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #whitespace)
]
