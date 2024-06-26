"
Interpreter for a small stack-based language that builds diagrams for boolean expressions.

"
Class {
	#name : #BexRpnInterpreter,
	#superclass : #Object,
	#traits : 'TCondMethod',
	#classTraits : 'TCondMethod classTrait',
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
		'announcer',
		'running',
		'animation',
		'paused',
		'branchNode'
	],
	#category : #'Bex-RPN'
}

{ #category : #'ops - bex' }
BexRpnInterpreter >> and [
  "(xy-z)"
  ^ self binOp: #and
]

{ #category : #execution }
BexRpnInterpreter >> autoStep [
  "response to the animation events"
  paused ifFalse: [self step]
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

{ #category : #'ops - bex' }
BexRpnInterpreter >> branch [
  self branch: data pop
]

{ #category : #accessing }
BexRpnInterpreter >> branch: varSymbol [
  branchVar := varSymbol.
  hi := data pop. lo := data pop.
  branchNode := base branch: varSymbol hi: hi lo: lo.
  ^ self push: branchNode
]

{ #category : #accessing }
BexRpnInterpreter >> call: aCtx toks: aToks [
  ctrl push: { ip. ctx. toks }.
  "set ip to zero because step increments it at end of each op."
  ctx := aCtx. ip := 0. self toks:aToks.
  self frameChanged.
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
    [q isArray or: [q isKindOf: OrderedCollection]] -> [ self call: #'(quote)' toks: q ].
    #else -> [self error: 'don''t know how to "do" ', q asString]}
]

{ #category : #execution }
BexRpnInterpreter >> doToken: aToken [
  self cond: {
    [(aToken isNumber | aToken isArray) or:
     [aToken isKindOf: OrderedCollection]]
    -> [ data push: aToken ].
    ['`!@' includes: aToken first] -> [|h t|
      h := aToken first. t := aToken allButFirst asSymbol.
      self cond: {
        [h = $`] -> [ data push: t ].              "`sym pushes a symbol"
        [h = $!] -> [ defs at: t put: data pop ].  "!x assigns x"
        [h = $@] -> [ data push: (defs at: t) ]}]. "@x fetches x"
    #else -> [
      defs at: aToken
        ifPresent: [:def |
          (def isArray or: [def isKindOf: OrderedCollection])
            ifTrue:[self call: aToken toks: def ]
            ifFalse: [self error: aToken asString, ' is not an executable word']]
        ifAbsent: [ self perform: aToken ]]}.
]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> dup [
  self push: base dup.
]

{ #category : #accessing }
BexRpnInterpreter >> end [
  self reset.
  announcer announce: (BexInterpreterDoneEvent new)
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

{ #category : #'ops - bex' }
BexRpnInterpreter >> hi [
  "( - o)" 
  data push: hi
]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> hide [
  (base scene childWithId: data pop) gsHide.
]

{ #category : #accessing }
BexRpnInterpreter >> hideAll [
  data pop do: #gsHide
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> i [
  self push: base i
]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> id [
  data push: (base scene idFromNumber: data pop)
]

{ #category : #execution }
BexRpnInterpreter >> initialCtx [
  ^ #'(top)'
]

{ #category : #initialization }
BexRpnInterpreter >> initialize [
  super initialize.
  paused := false.
  "make ourselves observable to BexDebuggerPanel"
  announcer := Announcer new.
  "the base builds the actual data structures."
  "(BexSketchApp replaces this with a BexSceneBase)"
  base := BexSceneBase new.
  "the rest is our forthlike interpreter."
  defs := Dictionary new.
  self reset.

]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> invert [
  | edge |
  edge := base scene childWithId: data pop.
  edge isInverted: (edge isInverted not)
]

{ #category : #'ops - bex' }
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

{ #category : #'ops - drawing' }
BexRpnInterpreter >> mov [
  | p|
  p := data pop.
  (base scene childWithId: data pop) gsPosition: p
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> o [
  self push: base o
]

{ #category : #accessing }
BexRpnInterpreter >> pause [
  paused := true
]

{ #category : #execution }
BexRpnInterpreter >> play [
  paused := false
]

{ #category : #ops }
BexRpnInterpreter >> pop [
  data push: ctrl pop
]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> pos [
  |o|
  o := base scene childWithId: data pop.
  data push: o gsPosition
]

{ #category : #ops }
BexRpnInterpreter >> push [
  ctrl push: data pop
]

{ #category : #accessing }
BexRpnInterpreter >> push: aNode [
  data push: aNode
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> replace [
  "( osv - O )"
  | sym val |
  val := data pop.
  sym := data pop.
  "self inform: 'sym:', sym asString, ' -> ', val asString."
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
  self toks: frame third.
]

{ #category : #accessing }
BexRpnInterpreter >> run: aString [
  self load: aString.
  self play.
]

{ #category : #'ops - drawing' }
BexRpnInterpreter >> setSymbol [
  | s|
  s := data pop.
  (base scene childWithId: data pop) symbol: s.
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> simp [
  "(o - q| return a quotation with steps of how to draw the simplification)"
  data push: (base simp: data pop).
]

{ #category : #execution }
BexRpnInterpreter >> step [
  "manual step or called by autostep"
  (ip > toks size) ifTrue: [
    (ctrl size > 0) ifTrue: [self return]
    ifFalse: [self end]]
  ifFalse: [ self doToken: (toks at: ip)].
  ip := ip + 1.
  announcer announce: (BexInstructionPointerChangedEvent new ip: ip)
]

{ #category : #accessing }
BexRpnInterpreter >> toks: anObject [
  self assert: (anObject isArray or: [anObject isKindOf: OrderedCollection]).
  toks := anObject.
]

{ #category : #accessing }
BexRpnInterpreter >> tos [
  ^ data top
]

{ #category : #events }
BexRpnInterpreter >> when: anEvent do: aBlock [
  announcer when: anEvent do: aBlock
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> x0 [
  self push: base x0
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> x1 [
  self push: base x1
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> x2 [
  self push: base x2
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> x3 [
  self push: base x3
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> x4 [
  self push: base x4
]

{ #category : #'ops - bex' }
BexRpnInterpreter >> xor [
  ^ self binOp: #xor
]
