"
The visiting strategy is a little weird here. We read the json to get a dictionary that we can inspect to determine a class to build.
Then we use the magritte descriptions to parse the other entries in the dictionary.
"
Class {
	#name : #GsJsonReader,
	#superclass : #MAVisitor,
	#instVars : [
		'stack',
		'object',
		'values'
	],
	#category : #'GameSketchLib-Magritte'
}

{ #category : #accessing }
GsJsonReader class >> read: aString [ 
  ^ self new read: aString
]

{ #category : #initialization }
GsJsonReader >> initialize [
  super initialize.
  stack := Stack new.
]

{ #category : #accessing }
GsJsonReader >> read: aString [
  ^ self walk: (STONJSON fromString: aString)
]

{ #category : #accessing }
GsJsonReader >> visitAnimationsDescription: d [
  self visitElementDescription: d
]

{ #category : #accessing }
GsJsonReader >> visitContainer: mc [
  "At this point, we have a class with default values and need to fill in the properties
   from the parsed json. To know what keys to look for and what to do with the values, we
   visit the magritte description of the fresh object."  
  self visitAll: mc children.
]

{ #category : #accessing }
GsJsonReader >> visitElementDescription: d [
  | key  |
  key := d asGsDescription jsonKey.
  values at: key ifPresent:[:raw |
    d write: raw to: object  ]
]

{ #category : #accessing }
GsJsonReader >> visitNumberDescription: d [
  "this allows parsing numbers wrapped in quotes"
  values at: d asGsDescription jsonKey
    ifPresent:[:raw |
      d write: raw asNumber to: object  ]
]

{ #category : #accessing }
GsJsonReader >> visitRelationDescription: d [
  |key|
  key := d asGsDescription jsonKey.
  self assert: key = 'children'
    description: 'don''t yet know how to handle other collections'.
  values at: key
    ifPresent: [:rawItems| 

      "(| collection |
         collection := d read: object.
         self assert: collection isEmpty. )"

      "... But you can't do this with BlElement children.
       You have to call addChild or you get errors about the space being nil."
    
      rawItems do: [:each |
        object addChild: (self walk: each)]]
]

{ #category : #accessing }
GsJsonReader >> walk: aDict [
  "walk the parsed json, using magritte to tell us how to parse the individual values"
  | result tmp |
  stack push: {object. values}.
  values := aDict. object := (aDict at: #class) asClass new.
  self visit: object magritteDescription.
  result := object.
  tmp := stack pop.  object := tmp first.  values := tmp second.
  ^ result
]
