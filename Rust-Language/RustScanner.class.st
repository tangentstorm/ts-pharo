Class {
	#name : #RustScanner,
	#superclass : #SmaCCScanner,
	#category : #'Rust-Language'
}

{ #category : #'generated-initialization' }
RustScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(30 'as' 14) #(30 'crate' 15) #(30 'in' 16) #(30 'macro_rules' 17) #(30 'pub' 18) #(30 'self' 19) #(30 'super' 20) #(30 'use' 21) #(26 '#!![' 2))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
RustScanner >> emptySymbolTokenId [
	^ 61
]

{ #category : #generated }
RustScanner >> errorTokenId [
	^ 62
]

{ #category : #generated }
RustScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(27).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(27) ].
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
				ifTrue: [ ^ self recordAndReportMatch: #(24) ].
			^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX5 ].
	^ self scanForTokenX12
]

{ #category : #generated }
RustScanner >> scanForTokenX1 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $!
		ifTrue: [ self step.
			currentCharacter == $!
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX10 [
	[ self recordMatch: #(29).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX11 [
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX10 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX7 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue:
			[ ^ self scanForTokenX4 ].
	((currentCharacter between: $% and: $&)
		or: [ currentCharacter == $+
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $< and: $@)
								or:
									[ '^|~' includes: currentCharacter ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX12 [
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(7 31) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(8 31) ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(10 31) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self scanForTokenX11
]

{ #category : #generated }
RustScanner >> scanForTokenX2 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX3 [
	self recordMatch: #(13 30).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(30).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX4 [
	[ self recordMatch: #(30).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX5 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $c
		ifTrue: [ (self scanForString: 'rate')
				ifTrue: [ ^ self recordAndReportMatch: #(4) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX6 [
	self recordMatch: #(31).
	self step.
	true
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(28) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX7 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX8 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX9 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #whitespace)
]
