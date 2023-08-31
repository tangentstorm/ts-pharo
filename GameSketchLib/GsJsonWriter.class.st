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
GsJsonWriter >> putKey: aKey val: aVal [
  self putKey: aKey.
  stream nextPutAll: '"'.
  stream nextPutAll: aVal asString.  
  stream nextPut: $".  
]

{ #category : #accessing }
GsJsonWriter >> visitContainer: aDescription [
  stream nextPutAll: indent.
  stream nextPut: ${.
  self putKey: #class val: object class name.
  aDescription children do: [:cd|
    skipped  ifFalse: [stream nextPutAll: ', ']
      ifTrue: [skipped := false].
    self visit: cd].
  stream nextPut: $}.
]

{ #category : #accessing }
GsJsonWriter >> visitElementDescription: d [
  | key val |

  key := d accessor readSelector.
  val := d read: object.

  key = 'background' ifTrue: [
    key := 'fill'.
    val := '#', val paint color asHexString ].
    
  self putKey: key val: val. 
]

{ #category : #accessing }
GsJsonWriter >> visitRelationDescription: d [
  |key vals|
  key := d accessor readSelector.
  vals := d read: object.
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

{ #category : #accessing }
GsJsonWriter >> visitSymbolDescription: aDescription [
   |v|
   v := aDescription read: object.
   (v isKindOf: BlElementNoId) ifTrue: [skipped := true] ifFalse: [
     self putKey: aDescription accessor readSelector
          val: v ].
]
