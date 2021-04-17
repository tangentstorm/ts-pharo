Class {
	#name : #K3Scanner,
	#superclass : #SmaCCScanner,
	#category : #'K3-Language'
}

{ #category : #'generated-initialization' }
K3Scanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(23 '_abs' 22) #(23 '_bin' 22) #(23 '_ci' 22) #(23 '_cos' 22) #(23 '_cosh' 22) #(23 '_di' 22) #(23 '_dj' 22) #(23 '_dot' 22) #(23 '_draw' 22) #(23 '_dv' 22) #(23 '_dvl' 22) #(23 '_exp' 22) #(23 '_floor' 22) #(23 '_gtime' 22) #(23 '_ic' 22) #(23 '_in' 22) #(23 '_inv' 22) #(23 '_jd' 22) #(23 '_lin' 22) #(23 '_log' 22) #(23 '_lsq' 22) #(23 '_mul' 22) #(23 '_sin' 22) #(23 '_sinh' 22) #(23 '_sm' 22) #(23 '_sqr' 22) #(23 '_sqrt' 22) #(23 '_ss' 22) #(23 '_ssr' 22) #(23 '_sv' 22) #(23 '_tan' 22) #(23 '_tanh' 22) #(23 '_vs' 22))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

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
	[ self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scan2 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(21).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForToken [
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter == Character cr
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $"
		ifTrue: [ [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(24) ].
			true ] whileTrue ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self scanForTokenX17
]

{ #category : #generated }
K3Scanner >> scanForTokenX1 [
	self recordMatch: #(23).
	self step.
	currentCharacter == $h
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $i
				ifTrue: [ self recordMatch: #(23).
					self step.
					currentCharacter == $l
						ifTrue: [ self recordMatch: #(23).
							self step.
							currentCharacter == $e
								ifTrue: [ self recordMatch: #(23).
									self step.
									currentCharacter == $[
										ifTrue: [ ^ self recordAndReportMatch: #(12) ].
									(currentCharacter == $.
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
										ifTrue: [ [ self recordMatch: #(23).
											self step.
											currentCharacter == $.
												or: [ (currentCharacter between: $A and: $Z)
														or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
												whileTrue ].
									^ self reportLastMatch ].
							(currentCharacter == $.
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_
												or: [ (currentCharacter between: $a and: $d)
														or: [ currentCharacter between: $f and: $z ] ] ] ])
								ifTrue: [ [ self recordMatch: #(23).
									self step.
									currentCharacter == $.
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue ].
							^ self reportLastMatch ].
					(currentCharacter == $.
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_
										or: [ (currentCharacter between: $a and: $k)
												or: [ currentCharacter between: $m and: $z ] ] ] ])
						ifTrue: [ [ self recordMatch: #(23).
							self step.
							currentCharacter == $.
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			(currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $h)
										or: [ currentCharacter between: $j and: $z ] ] ] ])
				ifTrue: [ [ self recordMatch: #(23).
					self step.
					currentCharacter == $.
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $g)
								or: [ currentCharacter between: $i and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX10 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX11 [
	self recordMatch: #(20).
	self step.
	currentCharacter == $/
		ifTrue: [ (self scanForString: ':''')
				ifTrue: [ ^ self recordAndReportMatch: #(20) ].
			^ self reportLastMatch ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX12 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX13 [
	self recordMatch: #(5).
	self step.
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX14 [
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX15 [
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $&)
				or: [ (currentCharacter between: $* and: $,)
						or: [ (currentCharacter between: $< and: $@)
								or:
									[ '^|~' includes: currentCharacter ] ] ] ])
		ifTrue: [ self recordMatch: #(19).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self recordAndReportMatch: #(19) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX16 [
	currentCharacter == $i
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $w
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter isSeparator
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	((currentCharacter between: $A and: $Z)
		or: [ (currentCharacter between: $a and: $c)
				or: [ (currentCharacter between: $e and: $h)
						or: [ (currentCharacter between: $j and: $v)
								or: [ currentCharacter between: $x and: $z ] ] ] ])
		ifTrue:
			[ ^ self scanForTokenX8 ].
	^ self scanForTokenX15
]

{ #category : #generated }
K3Scanner >> scanForTokenX17 [
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $`
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $d
		ifTrue:
			[ ^ self scanForTokenX4 ].
	^ self scanForTokenX16
]

{ #category : #generated }
K3Scanner >> scanForTokenX2 [
	self recordMatch: #(19 23).
	self step.
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX3 [
	self recordMatch: #(23).
	self step.
	currentCharacter == $f
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			(currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ [ self recordMatch: #(23).
					self step.
					currentCharacter == $.
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $e)
								or: [ currentCharacter between: $g and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX4 [
	self recordMatch: #(23).
	self step.
	currentCharacter == $o
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ [ self recordMatch: #(23).
					self step.
					currentCharacter == $.
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $n)
								or: [ currentCharacter between: $p and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX5 [
	self recordMatch: #(18 19).
	self step.
	currentCharacter == $:
		ifTrue: [ self recordMatch: #(18 19 20).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ [ self recordMatch: #(18).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $9)
						or: [ currentCharacter >= $; ] ] ])
		ifTrue: [ [ self recordMatch: #(18).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX6 [
	self recordMatch: #(19 23).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $"
		ifTrue: [ [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(25) ].
			true ] whileTrue ].
	(currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter == $.
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX8 [
	[ self recordMatch: #(23).
	self step.
	currentCharacter == $.
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> scanForTokenX9 [
	[ self recordMatch: #(17).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
K3Scanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace)
]
