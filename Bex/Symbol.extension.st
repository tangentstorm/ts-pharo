Extension { #name : #Symbol }

{ #category : #'*Bex' }
Symbol >> quoteForRpn [
  ^ ('`', self asString) asSymbol
]
