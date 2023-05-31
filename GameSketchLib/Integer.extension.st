Extension { #name : #Integer }

{ #category : #'*GameSketchLib' }
Integer >> toBits: k [
  "convert me to a ByteArray of n bits"
  | n r |
  n := self.
  r := ByteArray new: k.
  k to: 1 by: -1 do: [:i |
    r at: i put: (n bitAnd: 1).
	n := n bitShift: -1].
  ^ r
]
