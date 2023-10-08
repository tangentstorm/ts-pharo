Extension { #name : #Symbol }

{ #category : #'*Bex' }
Symbol >> isBexConstant [
  ^ #(O I) includes: self
]

{ #category : #'*Bex' }
Symbol >> isBexLiteral [
  ^ #(x0 x1 x2 x3 x4 O I) includes: self
]

{ #category : #'*Bex' }
Symbol >> quoteForRpn [
  ^ ('`', self asString) asSymbol
]
