Extension { #name : #BlPullHandler }

{ #category : #'*GameSketchLib' }
BlPullHandler >> patchOriginalTopPosition: y [
  "used by docking controls, as the element changes parent when you start the drag"
  originalPosition ifNotNil: [
    originalPosition := (originalPosition x) @ y]
]
