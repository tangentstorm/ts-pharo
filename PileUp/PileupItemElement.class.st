Class {
	#name : #PileupItemElement,
	#superclass : #BlElement,
	#instVars : [
		'data'
	],
	#category : #PileUp
}

{ #category : #accessing }
PileupItemElement >> forItem: item [
  |x y w h c id|
  x := item at: 'x'.
  y := item at: 'y'.
  w := item at: 'w'.
  h := item at: 'h'.
  data := item at: 'o'.
  c := item at: 'c'.
  id := item at: '_id'. 
  (c = 'pile') ifTrue: [self background: GsColors gold].
  self
    relocate: x@y;
    size: w@h;
    addChild: (BlTextElement new
      text: (data at: 'text') asRopedText);
    when: BlClickEvent do: [
      self background: Color red.
      self children first text: (item at: '_id') asRopedText.
      self parent spawnPile: id.
    ]
      
  
]
