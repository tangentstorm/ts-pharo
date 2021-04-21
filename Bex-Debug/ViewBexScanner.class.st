Class {
	#name : #ViewBexScanner,
	#superclass : #SmaCCScanner,
	#category : #'Bex-Debug'
}

{ #category : #generated }
ViewBexScanner >> emptySymbolTokenId [
	^ 28
]

{ #category : #generated }
ViewBexScanner >> errorTokenId [
	^ 29
]

{ #category : #generated }
ViewBexScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $$
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $(
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self scanForTokenX10
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX1 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX10 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $N
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $X
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $v
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $x
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX7 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ self scanForTokenX4 ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX2 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $:
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX3 [
	self step.
	currentCharacter == $I
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $O
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX4 [
	[ self recordMatch: #(18).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX5 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(14).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX6 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(15).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX7 [
	[ self recordMatch: #(17).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX8 [
	(self scanForString: 'oV')
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> scanForTokenX9 [
	(self scanForString: 'rc:')
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch
]

{ #category : #generated }
ViewBexScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace)
]
