"
Interpreter for a small stack-based language that builds diagrams for boolean expressions.

"
Class {
	#name : #BexRpnInterpreter,
	#superclass : #Object,
	#instVars : [
		'base',
		'hi',
		'lo',
		'branchVar',
		'data',
		'ctrl',
		'defs',
		'ip',
		'toks',
		'ctx',
		'announcer'
	],
	#category : #'Bex-RPN'
}

{ #category : #ops }
BexRpnInterpreter >> and [
  "(xy-z)"
  ^ self binOp: #and
]

{ #category : #accessing }
BexRpnInterpreter >> base: aBase [
  base := aBase.
]

{ #category : #accessing }
BexRpnInterpreter >> binOp: aSymbol [
  | x y |
  y := data pop. x := data pop.
  ^ self push: (base op: aSymbol x: x y: y)
]

{ #category : #ops }
BexRpnInterpreter >> branch [
  self branch: data pop
]

{ #category : #accessing }
BexRpnInterpreter >> branch: varSymbol [
  | o e |
  branchVar := varSymbol.
  hi := data pop. lo := data pop.
  o := base op: varSymbol x: lo y: hi.
  o cornerRadius: 25.
  e := o userData at: #incoming.
  e first gsStrokeStyle: #dashed; dstMarker: #none.
  e second gsStrokeStyle: #solid; dstMarker: #none.
  ^ self push: o
]

{ #category : #accessing }
BexRpnInterpreter >> call: aCtx toks: aToks [
  ctrl push: { ip. ctx }.
  "set ip to zero because step increments it at end of each op."
  ctx := aCtx. ip := 0. toks := aToks.
  self frameChanged.
]

{ #category : #execution }
BexRpnInterpreter >> cond: anAssocArray [
  anAssocArray detect: [:kv | kv key = #else or: kv key]
    ifFound: [:kv | ^ kv value value ]
    ifNone: [ ^ nil ]
]

{ #category : #accessing }
BexRpnInterpreter >> currentTokens [
  ^ toks
]

{ #category : #accessing }
BexRpnInterpreter >> data [
  ^ data
]

{ #category : #accessing }
BexRpnInterpreter >> defs [
  ^ defs
]

{ #category : #accessing }
BexRpnInterpreter >> do [
  "(q - ? | pop quote off stack and do it)"
  "quote can be either a symbol or array of tokens"
  | q | q := data pop.
  self cond: {
    [q isSymbol] -> [self doToken:q].
    [q isSequenceable] -> [ self call: #'(quote)' toks: q ].
    #else -> [self error: 'don''t know how to "do" ', q asString]}
]

{ #category : #execution }
BexRpnInterpreter >> doToken: aToken [
  self cond: {
    [aToken isNumber] -> [ data push: aToken ].
    ['`!@' includes: aToken first] -> [|h t|
      h := aToken first. t := aToken allButFirst asSymbol.
      self cond: {
        [h = $`] -> [ data push: t ].              "`sym pushes a symbol"
        [h = $!] -> [ defs at: t put: data pop ].  "!x assigns x"
        [h = $@] -> [ data push: (defs at: t) ]}]. "@x fetches x"
    #else -> [
      defs at: aToken
        ifPresent: [:def | self call: aToken toks: def ]
        ifAbsent: [ self perform: aToken ]]}.
]

{ #category : #ops }
BexRpnInterpreter >> dup [
  self push: base dup.
]

{ #category : #events }
BexRpnInterpreter >> frameChanged [
  announcer announce: (BexStackFrameChangedEvent new ip: ip)
]

{ #category : #accessing }
BexRpnInterpreter >> gtDebuggerFor: aView [
  | h1 |
  <gtView>
  h1 := [:x | GsTextShape new
    gsFill: 'eeeeee'; text: x; hMatchParent; vFitContent].
  ^ aView explicit
    title: 'Debugger';
    priority: 0;
    stencil: [
      BrVerticalPane new matchParent addChildren: {
        h1 value: 'data'.
        BrHorizontalFlow new hMatchParent vFitContent
          padding: (BlInsets all: 2);
          addChildren: (data reverse collect: [:x | 
            GsTextShape new gsStrokeColor: 'eeeeee'; text: x asString ]).
        h1 value: 'ctrl'.
        BrHorizontalFlow new hMatchParent vFitContent
          padding: (BlInsets all: 2);
          addChildren: (toks withIndexCollect: [:v :i| |bg|
            bg := (i = ip) ifTrue: [Color veryLightGray]
              ifFalse: [Color white].
             GsTextShape new text: v; background: bg]).
        h1 value: 'defs' }]
]

{ #category : #ops }
BexRpnInterpreter >> hi [
  "( - o)" 
  data push: hi
]

{ #category : #ops }
BexRpnInterpreter >> i [
  self push: base i
]

{ #category : #execution }
BexRpnInterpreter >> initialCtx [
  ^ #'(top)'
]

{ #category : #accessing }
BexRpnInterpreter >> initialize [
  super initialize.
  "make ourselves observable to BexDebuggerPanel"
  announcer := Announcer new.
  "the base builds the actual data structures."
  "(BexSketchApp replaces this with a BexSceneBase)"
  base := BexBase new.
  "the rest is our forthlike interpreter."
  defs := Dictionary new.
  self reset.

]

{ #category : #ops }
BexRpnInterpreter >> lo [
  "( - o)" 
  data push: lo
]

{ #category : #execution }
BexRpnInterpreter >> load: aString [
  | state actions def prev |
  self reset.
  state := #eval. "eval | define | compile | comment"
  toks := OrderedCollection new.
  actions := {
    #eval -> [:tok |
      (tok = #':')
        ifTrue: [ state := #define ]
        ifFalse: [toks add: tok ]].
    #define  -> [:tok |
      defs at: tok put: (def := OrderedCollection new).
      state := #compile].
    #compile -> [:tok |
      (tok = #';')
        ifTrue: [ state := #eval ]
        ifFalse: [ def add: tok ]]} asDictionary.
  (aString substrings collect: #asSymbol) do: [:tok |
    (state = #comment) ifTrue: [
      (tok last = $)) ifTrue: [ state := prev] "else discard" ]
    ifFalse: [
      (tok first = $() ifTrue: [
        (tok last ~= $)) ifTrue: [prev := state. state := #comment]]
      ifFalse: [(actions at: state) value: tok]]].
  defs at: self initialCtx put: toks.
  self frameChanged
]

{ #category : #ops }
BexRpnInterpreter >> o [
  self push: base o
]

{ #category : #ops }
BexRpnInterpreter >> pop [
  data push: ctrl pop
]

{ #category : #ops }
BexRpnInterpreter >> push [
  ctrl push: data pop
]

{ #category : #accessing }
BexRpnInterpreter >> push: aNode [
  data push: aNode
]

{ #category : #ops }
BexRpnInterpreter >> replace [
  "( osv - O )"
  | sym val |
  val := data pop.
  sym := data pop.
  self inform: 'sym:', sym asString, ' -> ', val asString.
  base set: sym to: val in: self tos
]

{ #category : #execution }
BexRpnInterpreter >> reset [
  "destroy all context about the running program"
  ip := 1.
  ctx := self initialCtx.
  toks := #().
  ctrl := Stack new.
  data := Stack new.
  announcer announce: (BexStackFrameChangedEvent new ip: ip)
]

{ #category : #ops }
BexRpnInterpreter >> return [
  | frame |
  frame := ctrl pop.
  ip := frame first.
  ctx := frame second.
  toks := defs at: ctx
]

{ #category : #ops }
BexRpnInterpreter >> simp [
  "(o - q| return a quotation with steps of how to draw the simplification)"
  | node| node := data pop.
  data push: OrderedCollection new
]

{ #category : #execution }
BexRpnInterpreter >> step [
  ""
  (ip > toks size) ifTrue: [self return]
  ifFalse: [ self doToken: (toks at: ip)].
  ip := ip + 1.
  announcer announce: (BexInstructionPointerChangedEvent new ip: ip)
]

{ #category : #accessing }
BexRpnInterpreter >> tos [
  ^ data top
]

{ #category : #events }
BexRpnInterpreter >> when: anEvent do: aBlock [
  announcer when: anEvent do: aBlock
]

{ #category : #ops }
BexRpnInterpreter >> x0 [
  self push: base x0
]

{ #category : #ops }
BexRpnInterpreter >> x1 [
  self push: base x1
]

{ #category : #ops }
BexRpnInterpreter >> x2 [
  self push: base x2
]

{ #category : #ops }
BexRpnInterpreter >> x3 [
  self push: base x3
]

{ #category : #ops }
BexRpnInterpreter >> x4 [
  self push: base x4
]

{ #category : #ops }
BexRpnInterpreter >> xor [
  ^ self binOp: #xor
]
