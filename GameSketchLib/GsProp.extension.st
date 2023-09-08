Extension { #name : #GsProp }

{ #category : #'*GameSketchLib' }
GsProp class >> bottomRight [
  ^ GsSelectorProp new
    readSelector: #gsBottomRight;
    writeSelector: #gsBottomRight:
]
