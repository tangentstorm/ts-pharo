Class {
	#name : #PileupItemElement,
	#superclass : #BlElement,
	#instVars : [
		'data',
		'app'
	],
	#category : #PileUp
}

{ #category : #accessing }
PileupItemElement >> app: aPileUpApp [
  app := aPileUpApp
]

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
  (c = 'pile') ifTrue: [self background: (Color fromHexString: 'ffe4c4') "bisque"].
  (c = 'card') ifTrue: [self background: (Color fromHexString: 'f0f8ff') "aliceblue"].
  (c = 'list') ifTrue: [self background: (Color fromHexString: '0e3f4c')].
  self
    relocate: x@y;
    size: w@h;
    effect: (BlSimpleShadowEffect
      color: (Color black alpha: 0.25)  offset: 2@2);
    addChild: (BlTextElement new
      text: (data at: 'text') asRopedText;
      padding: (BlInsets all: 5));
    when: BlDoubleClickEvent do: [
      app ifNotNil: [ app spawnPile: id ]]
      
  
]
