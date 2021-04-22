Class {
	#name : #ViewBexGraphBuilder,
	#superclass : #ViewBexASTStartNodeVisitor,
	#instVars : [
		'vhls',
		'vids'
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
    priority: 50;
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
ViewBexGraphBuilder >> gtRowSizesFor: aView [
  <gtView>
  |counts|
  counts := ((vids,{'NoV'}) collect: [:v| v -> 0]) asDictionary.
  vhls do:[:vhl| |v| v:=(vhl at:#v). counts at: v put: 1 +(counts at: v)].
  ^ aView explicit
    priority: 10; 
    title: 'Row Sizes';
    stencil: [ GtPlotterHorizontalBarChart new
        barWidthData: [:x | counts at: x];
        barWidthScale: (GtPlotterLinearScale new 
          domainFrom: 0 to: (counts values max));
        with: (GtPlotterDataGroup new values: vids; labelled: [:x | x])]
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
  vids := OrderedCollection new.
  vhls := OrderedCollection new.
  super initialize.
]

{ #category : #accessing }
ViewBexGraphBuilder >> visitRow: aRow [
  vhls add: ({
    #ix -> (aRow ix value).
    #v  -> (aRow v value).
    #hi -> (aRow hi value).
    #lo -> (aRow lo value).
    #row -> aRow.
  } asDictionary).
  super visitRow: aRow.
]

{ #category : #accessing }
ViewBexGraphBuilder >> visitStart: node [
  super visitStart: node.
  vids := node vids collect: [:v| v source].
  Transcript show: vids.
  
]
