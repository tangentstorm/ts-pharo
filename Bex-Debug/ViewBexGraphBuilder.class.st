Class {
	#name : #ViewBexGraphBuilder,
	#superclass : #ViewBexASTStartNodeVisitor,
	#instVars : [
		'vhls'
	],
	#category : #'Bex-Debug-Bex-Debug'
}

{ #category : #accessing }
ViewBexGraphBuilder class >> simpleExample [
  <gtExample>
  |node ex|
  node := ViewBexParser simpleExample.
  ex := ViewBexGraphBuilder new.
  ex accept: node.
  ^ ex
]

{ #category : #accessing }
ViewBexGraphBuilder >> gtGraphFor: aView [
  <gtView>
  ^ aView mondrian
    title: 'BDD Graph';
    priority: 10;
    painting: [:g| |edge|
      g nodes
        shape: [:x| BlTextElement new
          text: ((x at: #v) asRopedText);
            padding: (BlInsets all: 10);
            border: (BlBorder paint: Color gray);
          geometry: (BlCircle new) ];
        with: vhls.
        
     edge := [:node :which ||ref|
       ref := node at: which.
       (ref nid source beginsWith: 'X')
         ifTrue: [ vhls first ]
         ifFalse:[ vhls at: (ref nid source asNumber + 1)]]. 

     "lo edges"
     g edges
       connectTo: [:n| edge value: n value: #lo];
       connectTo: [:n| edge value: n value: #hi].

     g layout tree.]
    
]

{ #category : #accessing }
ViewBexGraphBuilder >> gtVHLsFor: aView [
  <gtView>
  ^ aView columnedList
    title: 'VHL Triples' ;
    items: [ vhls ];
    column: 'ix'   text: [:each| each at: #ix ];
    column: 'v'    text: [:each| each at: #v ];
    column: 'hi'   text: [:each| (each at: #hi) source ];
    column: 'lo'   text: [:each| (each at: #lo) source ]

]

{ #category : #accessing }
ViewBexGraphBuilder >> initialize [
  vhls := OrderedCollection new.
  super initialize.
]

{ #category : #accessing }
ViewBexGraphBuilder >> visitRow: aRow [
  vhls add: ({
    #ix -> (aRow ix value).
    #v  -> (aRow vid value).
    #hi -> (aRow hi value).
    #lo -> (aRow lo value).
    #row -> aRow.
  } asDictionary).
  super visitRow: aRow.
]
