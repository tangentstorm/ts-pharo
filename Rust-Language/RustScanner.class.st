Class {
	#name : #RustScanner,
	#superclass : #SmaCCScanner,
	#category : #'Rust-Language'
}

{ #category : #'generated-initialization' }
RustScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(60 '''_' 7) #(60 '''static' 8) #(61 'Self' 27) #(61 'as' 31) #(61 'async' 32) #(61 'const' 33) #(61 'crate' 34) #(61 'dyn' 35) #(61 'extern' 36) #(61 'false' 56) #(61 'fn' 37) #(61 'for' 38) #(61 'impl' 39) #(61 'in' 40) #(61 'macro_rules' 41) #(61 'mod' 42) #(61 'mut' 43) #(61 'pub' 44) #(61 'ref' 45) #(61 'self' 46) #(61 'super' 47) #(61 'true' 56) #(61 'unsafe' 48) #(61 'use' 49) #(61 'where' 50))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
RustScanner >> emptySymbolTokenId [
	^ 221
]

{ #category : #generated }
RustScanner >> errorTokenId [
	^ 222
]

{ #category : #generated }
RustScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(57) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(57).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(57) ].
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
				ifTrue: [ ^ self recordAndReportMatch: #(53) ].
			^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1 62) ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(11 62) ].
	^ self scanForTokenX14
]

{ #category : #generated }
RustScanner >> scanForTokenX1 [
	self recordMatch: #(62).
	self step.
	currentCharacter == $!
		ifTrue: [ self step.
			currentCharacter == $!
				ifTrue: [ [ self recordMatch: #(55).
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
	self recordMatch: #(14 62).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX11 [
	self recordMatch: #(5 62).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX12 [
	[ self recordMatch: #(59).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX13 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
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
			[ ^ self scanForTokenX5 ].
	('%^|~' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX14 [
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(12 62) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(13 62) ].
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
		ifTrue: [ ^ self recordAndReportMatch: #(21 62) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(22 62) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(23 62) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(24 62) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(25 62) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(26 62) ].
	^ self scanForTokenX13
]

{ #category : #generated }
RustScanner >> scanForTokenX2 [
	self recordMatch: #(62).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ self recordMatch: #(60).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(58) ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ [ self recordMatch: #(60).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	true
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(58) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX3 [
	self recordMatch: #(62).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(53).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX4 [
	self recordMatch: #(30 61).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(61).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX5 [
	[ self recordMatch: #(61).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX6 [
	self recordMatch: #(62).
	self step.
	currentCharacter == $.
		ifTrue: [ self recordMatch: #(16).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(17) ].
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(18) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX7 [
	self recordMatch: #(62).
	self step.
	currentCharacter == $c
		ifTrue: [ (self scanForString: 'rate')
				ifTrue: [ ^ self recordAndReportMatch: #(4) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX8 [
	[ self recordMatch: #(54).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX9 [
	self recordMatch: #(19 62).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #whitespace)
]
