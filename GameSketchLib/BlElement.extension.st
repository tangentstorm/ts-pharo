Extension { #name : #BlElement }

{ #category : #'*GameSketchLib' }
BlElement >> findChild: aPath [
  "aPath should be #(list of symbols)"
  ^ aPath inject: self into: [:accum :each| accum childNamed: each]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottom [
  ^ self position y + self extent y
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottom: y [
  self gsMoveBy: 0 @ (y - self gsBottom)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsCenter [
  ^ self position + (self extent / 2)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsCenter: aPoint [
  ^ self gsMoveBy: (aPoint - self gsCenter) 
]

{ #category : #'*GameSketchLib' }
BlElement >> gsContainsPoint: p [
  ^ self bounds asRectangle containsPoint: p 
]

{ #category : #'*GameSketchLib' }
BlElement >> gsFill [
  "only works for objects with a paint background"
  ^ self background paint color
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
BlElement >> gsId [
  ^ (self id isKindOf: BlElementNoId)
    ifTrue: ['']
    ifFalse: [self id asSymbol asString]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsId: aString [
  self id: aString
]

{ #category : #'*GameSketchLib' }
BlElement >> gsIdDescription [
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #gsId;
    label: 'Id';
    priority: 0;
    yourself
]

{ #category : #'*GameSketchLib' }
BlElement >> gsJson [
  | ws |
  ws := WriteStream on: String new.
  self gsJsonOn: ws.
  ^ ws contents
]

{ #category : #'*GameSketchLib' }
BlElement >> gsJsonOn: aStream [
  GsJsonWriter
    write: self
    description: self magritteDescription
    to: aStream
]

{ #category : #'*GameSketchLib' }
BlElement >> gsLeft [
  ^ self position x
]

{ #category : #'*GameSketchLib' }
BlElement >> gsLeft: x [
  self gsMoveBy: (x - self gsLeft)@0
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
BlElement >> gsRight [
  ^ self position x + self extent x
]

{ #category : #'*GameSketchLib' }
BlElement >> gsRight: x [
  self gsMoveBy: (x - self gsRight)@0
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
