Class {
	#name : #BexDebuggerPanel,
	#superclass : #GsDockable,
	#instVars : [
		'rpn',
		'buttons',
		'stackFrame',
		'ip'
	],
	#category : #'Bex-Apps'
}

{ #category : #accessing }
BexDebuggerPanel >> initialize [
  super initialize title: 'Debugger'.
  ip := 1.
]

{ #category : #accessing }
BexDebuggerPanel >> makeButtons [
  ^ buttons := BrHorizontalPane new hMatchParent vFitContent;
    padding: (BlInsets all: 2);
    background: Color veryVeryLightGray;
    addChild: (BlTextElement new text: '[step]' asRopedText).
]

{ #category : #accessing }
BexDebuggerPanel >> makeStackFrame [
  ^ stackFrame := BrHorizontalFlow new matchParent
    padding: (BlInsets all: 2);
    addChild: (BlTextElement new text: '(stackframe)' asRopedText)
]

{ #category : #accessing }
BexDebuggerPanel >> makeWorkArea [
  ^ workArea := BrVerticalPane new matchParent  
    background: Color white;
    addChildren: {
      self makeButtons.
      self makeStackFrame }.
]

{ #category : #accessing }
BexDebuggerPanel >> redrawStackFrame [
  | toks current|
  toks := rpn currentTokens.
  stackFrame removeChildren
    addChildren: (toks collect: [:tok |
      GsTextShape new
        text: tok asString;
        gsStrokeColor: 'eeeeee' ]).
  current := stackFrame children at: ip ifAbsent: [nil].
  current ifNotNil: [:c |c gsFill: 'eeeeee' ].
]

{ #category : #accessing }
BexDebuggerPanel >> rpn: anRpnBuilder [
  rpn := anRpnBuilder 
    when: BexInterpreterEvent
    do: [:e | ip := e ip. self redrawStackFrame]
]
