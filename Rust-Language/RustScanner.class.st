Class {
	#name : #RustScanner,
	#superclass : #SmaCCScanner,
	#category : #'Rust-Language'
}

{ #category : #generated }
RustScanner >> emptySymbolTokenId [
	^ 20
]

{ #category : #generated }
RustScanner >> errorTokenId [
	^ 21
]

{ #category : #generated }
RustScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(9).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
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
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
RustScanner >> scanForToken [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self scanForTokenX6
]

{ #category : #generated }
RustScanner >> scanForTokenX1 [
	self recordMatch: #(13).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(7).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX2 [
	[ self recordMatch: #(12).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX3 [
	self recordMatch: #(13).
	self step.
	true
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self recordAndReportMatch: #(10) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX4 [
	[ self recordMatch: #(8).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX5 [
	[ self recordMatch: #(11).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> scanForTokenX6 [
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX5 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX4 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $&)
				or: [ (currentCharacter between: $* and: $.)
						or: [ (currentCharacter between: $: and: $@)
								or:
									[ '^|~' includes: currentCharacter ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch
]

{ #category : #generated }
RustScanner >> tokenActions [
	^ #(nil nil nil nil nil nil #comment #whitespace)
]
