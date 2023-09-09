Class {
	#name : #PileupItemElement,
	#superclass : #BlElement,
	#instVars : [
		'data',
		'app',
		'kind',
		'couchId'
	],
	#category : #PileUp
}

{ #category : #accessing }
PileupItemElement >> app: aPileUpApp [
  app := aPileUpApp
]

{ #category : #accessing }
PileupItemElement >> couchId [
  ^ couchId
]

{ #category : #accessing }
PileupItemElement >> forItem: item [
  | id x y w h c el |
  data := item at: 'o'.
  x := item at: 'x'.
  y := item at: 'y'.
  w := item at: 'w'.
  h := item at: 'h'.
  couchId := id := item at: '_id'.
  c := item at: 'c'.
  kind := c asSymbol.
  c = 'pile' ifTrue: [ self background: (Color fromHexString:
    (id = '@home' ifFalse: [ 'ffe4c4'	"bisque" ] ifTrue: [ '96e9cf' ])) ].
  c = 'card' ifTrue: [ self background: (Color fromHexString: 'f0f8ff') "aliceblue" ].
  self
    relocate: x @ y;
    size: w @ h;
    effect: (BlSimpleShadowEffect color: (Color black alpha: 0.25) offset: 2 @ 2);
    addChild: (BlTextElement new
      text: (data at: #text) asRopedText;
      padding: (BlInsets all: 5)) as: #text;
    when: BlDoubleClickEvent do: [ app ifNotNil: [ app spawnPile: id ] ];
    addAptitude: (BrWithContextMenuAptitude
      handle: [ BlElement new size: 5 @ 5 ]
      content: [ self makeMenu ]).
  c = 'list' ifTrue: [
    self background: (Color fromHexString: '0e3f4c').
    el := self childNamed: #text.
    el text foreground: (Color fromHexString: '5f9ea0')].
]

{ #category : #accessing }
PileupItemElement >> isPile [
  ^ kind = #pile
]

{ #category : #accessing }
PileupItemElement >> makeMenu [
  ^ BrVerticalPane new 
    background: Color veryDarkGray;
    addChild: ((GsCell for: 'menu?') asElement fitContent);
    size: 60 @ 100
]

{ #category : #accessing }
PileupItemElement >> text [
  ^ data at: #text
]
