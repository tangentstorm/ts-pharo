Class {
	#name : #K3Scanner,
	#superclass : #SmaCCScanner,
	#category : #'K3-Language'
}

{ #category : #generated }
K3Scanner >> emptySymbolTokenId [
	^ 12
]

{ #category : #generated }
K3Scanner >> errorTokenId [
	^ 13
]

{ #category : #generated }
K3Scanner >> scan1 [
	[ self recordMatch: #(3).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(3).
					self step.
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scan2 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $\ ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
K3Scanner >> scan3 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(4).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			currentCharacter == $\ ifTrue: [ ^ self scan3 ].
			^ self scan2 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan2
]

{ #category : #generated }
K3Scanner >> scanForToken [
	self step.
	currentCharacter == $-
		ifTrue: [ self step.
			currentCharacter isDigit ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter == $/
		ifTrue: [ self step.
			(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
				ifTrue: [ [ self recordMatch: #(2).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $` ifTrue: [ ^ self scanForTokenX1 ].
	currentCharacter isDigit ifTrue: [ ^ self scan1 ].
	(currentCharacter == Character tab
		or: [ currentCharacter == Character newPage
				or: [ currentCharacter == Character space ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX1 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan2 ].
	currentCharacter == $a
		ifTrue: [ (self scanForString: 'lpha')
				ifTrue: [ [ self recordMatch: #(4).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> tokenActions [
	^ #(#whitespace #comment)
]
