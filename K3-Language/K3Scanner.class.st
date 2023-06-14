Class {
	#name : #K3Scanner,
	#superclass : #SmaCCScanner,
	#category : #'K3-Language'
}

{ #category : #generated }
K3Scanner >> emptySymbolTokenId [
	^ 48
]

{ #category : #generated }
K3Scanner >> errorTokenId [
	^ 49
]

{ #category : #generated }
K3Scanner >> scan1 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $\ ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
K3Scanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(12).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			currentCharacter == $\ ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan1
]

{ #category : #generated }
K3Scanner >> scan3 [
	[ self recordMatch: #(14).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(14).
					self step.
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scan4 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter == $\ ifTrue: [ ^ self scan5 ].
	true ] whileTrue
]

{ #category : #generated }
K3Scanner >> scan5 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(15).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter == $\ ifTrue: [ ^ self scan5 ].
			^ self scan4 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan4
]

{ #category : #generated }
K3Scanner >> scanForToken [
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == Character cr ifTrue: [ ^ self scanForTokenX8 ].
	^ self scanForTokenX10
]

{ #category : #generated }
K3Scanner >> scanForTokenX1 [
	self recordMatch: #(10).
	(self scanForString: 'hile[') ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX10 [
	currentCharacter == $" ifTrue: [ ^ self scan1 ].
	currentCharacter == $( ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $) ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $- ifTrue: [ ^ self scanForTokenX7 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter == $; ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $] ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $` ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $d ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $i ifTrue: [ ^ self scanForTokenX2 ].
	currentCharacter == $w ifTrue: [ ^ self scanForTokenX1 ].
	^ self scanForTokenX9
]

{ #category : #generated }
K3Scanner >> scanForTokenX2 [
	self recordMatch: #(10).
	(self scanForString: 'f[') ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX3 [
	self recordMatch: #(10).
	(self scanForString: 'o[') ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX4 [
	self recordMatch: #(15).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ [ self recordMatch: #(15).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX5 [
	self step.
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(13).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX6 [
	[ self recordMatch: #(10).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX7 [
	self recordMatch: #(11).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter isDigit ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX8 [
	self recordMatch: #(9).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX9 [
	currentCharacter isDigit ifTrue: [ ^ self scan3 ].
	currentCharacter isSeparator ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scanForTokenX6 ].
	((currentCharacter between: $! and: $&)
		or: [ (currentCharacter between: $* and: $@)
				or: [ (currentCharacter between: $^ and: $_) or: [ '|~' includes: currentCharacter ] ] ])
		ifTrue: [ self recordMatch: #(11).
			self step.
			currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(16) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil #whitespace nil nil nil nil #comment)
]
