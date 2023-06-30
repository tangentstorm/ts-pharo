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
  | x y w h c id |
  data := item at: 'o'.
  x := item at: 'x'.
  y := item at: 'y'.
  w := item at: 'w'.
  h := item at: 'h'.
  id := item at: '_id'.
  c := item at: 'c'.
  c = 'pile' ifTrue: [ self background: (Color fromHexString:
    (id = '@home' ifFalse: [ 'ffe4c4'	"bisque" ] ifTrue: [ '96e9cf' ])) ].
  c = 'card' ifTrue: [ self background: (Color fromHexString: 'f0f8ff') "aliceblue" ].
  c = 'list' ifTrue: [ self background: (Color fromHexString: '0e3f4c') ].
  self
    relocate: x @ y;
    size: w @ h;
    effect: (BlSimpleShadowEffect color: (Color black alpha: 0.25) offset: 2 @ 2);
    addChild: (BlTextElement new
      text: (data at: 'text') asRopedText;
      padding: (BlInsets all: 5));
    when: BlDoubleClickEvent do: [ app ifNotNil: [ app spawnPile: id ] ];
    addAptitude: (BrWithContextMenuAptitude
      handle: [ BlElement new size: 5 @ 5 ]
      content: [ self makeMenu ])
]

{ #category : #accessing }
PileupItemElement >> makeMenu [
  ^ BrVerticalPane new 
    background: Color veryDarkGray;
    addChild: ((GsCell for: 'menu?') asElement fitContent);
    size: 60 @ 100
]
