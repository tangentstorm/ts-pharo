Extension { #name : #Object }

{ #category : #'*GameSketchLib' }
Object >> gsJson [
  | ws |
  ws := WriteStream on: String new.
  self gsJsonOn: ws.
  ^ ws contents
]

{ #category : #'*GameSketchLib' }
Object >> gsJsonOn: aStream [
  GsJsonWriter
    write: self
    description: self magritteDescription
    to: aStream
]

{ #category : #'*GameSketchLib' }
Object >> gsSvg [
  | ws |
  ws := WriteStream on: String new.
  self gsSvgOn: ws.
  ^ ws contents
]

{ #category : #'*GameSketchLib' }
Object >> gsSvgOn: aStream [
  
]
