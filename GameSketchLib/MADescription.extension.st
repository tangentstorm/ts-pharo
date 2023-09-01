Extension { #name : #MADescription }

{ #category : #'*GameSketchLib' }
MADescription >> asGsDescription [
  ^ GsDescriptionWrapper new for: self
]
