Class {
	#name : #K3Scanner,
	#superclass : #SmaCCScanner,
	#category : #'K3-Language'
}

{ #category : #generated }
K3Scanner >> emptySymbolTokenId [
	^ 59
]

{ #category : #generated }
K3Scanner >> errorTokenId [
	^ 60
]

{ #category : #generated }
K3Scanner >> scan1 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter == $\ ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
K3Scanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(15).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter == $\ ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan1
]

{ #category : #generated }
K3Scanner >> scan3 [
	[ self recordMatch: #(18).
	self step.
	currentCharacter == $. ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scan4 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(18).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scan5 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $\ ifTrue: [ ^ self scan6 ].
	true ] whileTrue
]

{ #category : #generated }
K3Scanner >> scan6 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(19).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter == $\ ifTrue: [ ^ self scan6 ].
			^ self scan5 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan5
]

{ #category : #generated }
K3Scanner >> scanForToken [
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == Character cr ifTrue: [ ^ self scanForTokenX11 ].
	currentCharacter == $" ifTrue: [ ^ self scan1 ].
	currentCharacter == $' ifTrue: [ ^ self scanForTokenX10 ].
	^ self scanForTokenX13
]

{ #category : #generated }
K3Scanner >> scanForTokenX1 [
	self recordMatch: #(13).
	(self scanForString: 'hile[') ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(13).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX10 [
	self recordMatch: #(17).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX11 [
	self recordMatch: #(12).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX12 [
	currentCharacter == $w ifTrue: [ ^ self scanForTokenX1 ].
	currentCharacter == ${ ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $} ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter isDigit ifTrue: [ ^ self scanForTokenX7 ].
	currentCharacter isSeparator ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scanForTokenX6 ].
	(currentCharacter between: $! and: $~)
		ifTrue: [ self recordMatch: #(14).
			self step.
			currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(20) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX13 [
	currentCharacter == $( ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $) ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $- ifTrue: [ ^ self scanForTokenX8 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $; ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $[ ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $\ ifTrue: [ ^ self scanForTokenX9 ].
	currentCharacter == $] ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $` ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $d ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $i ifTrue: [ ^ self scanForTokenX2 ].
	^ self scanForTokenX12
]

{ #category : #generated }
K3Scanner >> scanForTokenX2 [
	self recordMatch: #(13).
	(self scanForString: 'f[') ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(13).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX3 [
	self recordMatch: #(13).
	(self scanForString: 'o[') ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(13).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX4 [
	self recordMatch: #(17).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(16).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX5 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ [ self recordMatch: #(19).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX6 [
	[ self recordMatch: #(13).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX7 [
	self recordMatch: #(18).
	self step.
	currentCharacter == $. ifTrue: [ ^ self scan4 ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter isDigit ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX8 [
	self recordMatch: #(14).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter isDigit ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX9 [
	self recordMatch: #(14 17).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(17 20) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil #whitespace nil nil nil nil #comment)
]
