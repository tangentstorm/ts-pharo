"
I make some small modifications to {{gtClass:GtMondrian}}.

In particular, these `edges` and `nodes` methods can be called multiple times.


"
Class {
	#name : #GsMondrian,
	#superclass : #GtMondrian,
	#instVars : [
		'edgeBuilder',
		'nodeBuilder'
	],
	#category : #'GameSketchLib-Mondrian'
}

{ #category : #accessing }
GsMondrian >> edges [
  ^ edgeBuilder ifNil: [ edgeBuilder := super edges]
]

{ #category : #accessing }
GsMondrian >> nodes [
  ^ nodeBuilder ifNil: [ nodeBuilder := super nodes]
]
