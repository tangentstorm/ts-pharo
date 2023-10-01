Class {
	#name : #BexDebuggerPanel,
	#superclass : #GsDockable,
	#instVars : [
		'rpn',
		'buttons',
		'stackFrame'
	],
	#category : #'Bex-Apps'
}

{ #category : #accessing }
BexDebuggerPanel >> initialize [
  super initialize title: 'Debugger'.
  workArea addChild:
   (BrVerticalPane new addChildren: {
      self makeButtons.
      self makeStackFrame}).
]

{ #category : #accessing }
BexDebuggerPanel >> makeButtons [
  buttons := BlTextElement new text: '[step]' asRopedText.
]

{ #category : #accessing }
BexDebuggerPanel >> makeStackFrame [
  stackFrame := BrHorizontalFlow new
    addChild: (
       BlTextElement new text: '(stackframe)' asRopedText)
]

{ #category : #accessing }
BexDebuggerPanel >> redrawStackFrame [
  | toks |
  toks := rpn currentTokens.
  stackFrame removeChildren
    addChildren: (toks collect: [:tok |
      GsTextShape new
        text: tok asString;
        gsStrokeColor: 'eeeeee' ])
]

{ #category : #accessing }
BexDebuggerPanel >> rpn: anRpnBuilder [
  rpn := anRpnBuilder 
    when: BexStackFrameChangedEvent
    do: [self redrawStackFrame]
]
