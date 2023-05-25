Class {
	#name : #BexDef,
	#superclass : #Bex,
	#category : #Bex
}

{ #category : #accessing }
BexDef >> asNodes [
  "return a list containing myself and all subnodes"
  |res|
  res := OrderedCollection new.
  res add: self.
  args do: [:each|
    res addAll: each asNodes].
  ^ res

  
  
]

{ #category : #accessing }
BexDef >> gtGraphFor: aView [
  <gtView>
  ^ aView mondrian
    title: 'Graph';
    painting: [:m|
      |nodes| nodes := self asNodes.
      m nodes shape: #stencil; with: nodes.
      m edges connect: nodes
        from: #yourself
        toAll: #immediateChildren.
      m layout tree
    ].
]

{ #category : #accessing }
BexDef >> immediateChildren [
  ^ args
]

{ #category : #accessing }
BexDef >> nodeString [
  ^ op asString
]

{ #category : #accessing }
BexDef >> op: anInt args: argList [ 
  op := anInt.
  args := argList.
]

{ #category : #accessing }
BexDef >> printString [
"  (args size = 2)
    ifTrue: [^ self asInfixString]"
  ^ op asString
     , '['
     , (', ' join: (args collect: #asString))
     , ']'    
]
