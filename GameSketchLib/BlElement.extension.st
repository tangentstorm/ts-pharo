Extension { #name : #BlElement }

{ #category : #'*GameSketchLib' }
BlElement >> findChild: aPath [
  "aPath should be #(list of symbols)"
  ^ aPath inject: self into: [:accum :each| accum childNamed: each]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsContainsPoint: p [
  ^ self bounds asRectangle containsPoint: p 
]

{ #category : #'*GameSketchLib' }
BlElement >> gsHandles [
  "return a collection of handles."
  ^ { BlResizerElement new attachTo: self}
]

{ #category : #'*GameSketchLib' }
BlElement >> gsHide [
  self visibility: BlVisibilityHidden new
]

{ #category : #'*GameSketchLib' }
BlElement >> gsMoveBy: aPoint [
  self gsPosition: (self gsPosition + aPoint)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsPosition [
  ^ self position
]

{ #category : #'*GameSketchLib' }
BlElement >> gsPosition: aPoint [
    "this has to be a separate interface from 'position', because shapes know where they are regardless of layout. See GsLineShape for extreme example."
    self relocate: aPoint
]

{ #category : #'*GameSketchLib' }
BlElement >> gsShow [
  self visibility: BlVisibilityVisible new
]

{ #category : #'*GameSketchLib' }
BlElement >> gsTop [
  ^ self position y
]

{ #category : #'*GameSketchLib' }
BlElement >> gsTop: y [
  self gsMoveBy: 0 @ (y - self gsTop)
]
