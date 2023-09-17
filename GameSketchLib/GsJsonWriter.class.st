Class {
	#name : #GsJsonWriter,
	#superclass : #MAWriter,
	#instVars : [
		'indent',
		'skipped'
	],
	#category : #'GameSketchLib-Magritte'
}

{ #category : #accessing }
GsJsonWriter >> defaultWriteStream [
  ^ WriteStream on: String new
]

{ #category : #accessing }
GsJsonWriter >> initialize [
  super initialize.
  indent := ''.
  skipped := false.
]

{ #category : #accessing }
GsJsonWriter >> putKey: aKey [ 
  stream nextPut: $".
  stream nextPutAll: aKey asString.
  stream nextPutAll: '":'.
]

{ #category : #accessing }
GsJsonWriter >> putKey: aKey stringVal: aVal [
  self putKey: aKey.
  stream nextPutAll: (aVal asString surroundedBy: '"')
]

{ #category : #visiting }
GsJsonWriter >> visitAnimationsDescription: d [
  self putKey: #animations.
  stream nextPutAll: (STONJSON toString: (d read: object)).
]

{ #category : #visiting }
GsJsonWriter >> visitContainer: aDescription [
  | oldSkipped |
	stream nextPutAll: indent.
  stream nextPut: ${.
  self putKey: #class stringVal: object class name.
  oldSkipped := skipped.
  skipped := false.
  aDescription children do: [:cd|
    skipped  ifFalse: [stream nextPutAll: ', ']
      ifTrue: [skipped := false].
    self visit: cd].
  stream nextPut: $}.
  skipped := oldSkipped.
]

{ #category : #visiting }
GsJsonWriter >> visitElementDescription: d [
  self putKey: d asGsDescription jsonKey stringVal: (d read: object).
]

{ #category : #visiting }
GsJsonWriter >> visitNumberDescription: d [
  self putKey: d asGsDescription jsonKey.
  "don't quote the number"
  stream nextPutAll: (d read: object) asString.
]

{ #category : #visiting }
GsJsonWriter >> visitRelationDescription: d [
  |key vals|
  key := d asGsDescription jsonKey.
  vals := d read: object.
  vals ifEmpty: [skipped := true].
  vals ifNotEmpty: [ |first oldIndent|
    first := true.
    self putKey: key.
    stream nextPutAll: '[' , String cr.
    oldIndent := indent.
    indent := indent, '  '.
    vals do: [:v|
      first ifTrue: [first:=false] 
            ifFalse: [ stream nextPutAll: ',', String cr ].
      self write: v description: v magritteDescription to: stream].
    indent := oldIndent.
    stream nextPut: $]. ].
]

{ #category : #visiting }
GsJsonWriter >> visitStringDescription: d [
  (d read: object)
    ifEmpty: [ skipped := true ]
    ifNotEmpty: [:val | self putKey: d asGsDescription jsonKey stringVal: val].
]
