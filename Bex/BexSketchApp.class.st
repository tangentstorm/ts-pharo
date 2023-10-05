Class {
	#name : #BexSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'graphTool',
		'arranger',
		'debugger',
		'rpn',
		'runButton',
		'bexAnimation',
		'makeBexAnimation',
		'pauseButton'
	],
	#category : #'Bex-Apps'
}

{ #category : #accessing }
BexSketchApp >> bexAnimation [
  ^ bexAnimation
]

{ #category : #accessing }
BexSketchApp >> initialTools [
  ^ { GsSelectTool new.
  	graphTool := BexGraphTool new symbol: #x0. }
]

{ #category : #accessing }
BexSketchApp >> initialize [
  rpn := BexRpnInterpreter new.
  super initialize.
  ui addAnimation: self makeBexAnimation.
  rpn base: (BexSceneBase new scene: scene).
  self scene size: 1920@1080; gsFill: '#5588bb'
]

{ #category : #accessing }
BexSketchApp >> makeArranger [
  ^ arranger := GsArrangePanel new
    selection: selection.
]

{ #category : #accessing }
BexSketchApp >> makeBexAnimation [
  ^ bexAnimation := (BlAnimation new 
      when: BlAnimationStepEvent do: [:e | rpn step ];
      beInfinite).
]

{ #category : #accessing }
BexSketchApp >> makeDebugger [
  ^ debugger := BexDebuggerPanel new rpn: rpn
]

{ #category : #accessing }
BexSketchApp >> makePauseButton [
  ^ pauseButton := BrButton new 
    aptitude: BrGlamorousButtonWithIconAptitude;
    icon: BrGlamorousVectorIcons pause;
    label: 'pause';
    action: [ rpn pause ].
]

{ #category : #accessing }
BexSketchApp >> makeRunButton [
  ^ runButton := BrButton new 
    aptitude: BrGlamorousButtonWithIconAptitude;
    icon: BrGlamorousVectorIcons play;
    label: 'run';
    action: [ rpn play ].
]

{ #category : #accessing }
BexSketchApp >> makeSymbolDropdown [
  | button |
  ^ button := BrButton new
      aptitude: BrGlamorousButtonWithLabelAndIconAptitude +
        (BrGlamorousWithDropdownAptitude
          handle: [BrButton new
            aptitude:
              BrGlamorousButtonRectangularAptitude +
              BrGlamorousButtonIconAptitude;
            icon: BrGlamorousIcons menu ]
          content: [
            BrSimpleList new fitContent
              stencil: [:o | BrLabel new
                aptitude: BrGlamorousLabelAptitude +
                  (BrStyleCommonAptitude new
                    default: [:s| s background: Color transparent];
                    hovered: [:s| s background: Color cyan]);
                text: o;
                when: BlClickEvent do: [:e |
                  e consumed: true.
                  button label: o asText.
                  graphTool symbol: o.
                  selection do: [:each|  [each symbol: o] onErrorDo: []].
                  e currentTarget fireEvent:
                    BrDropdownHideWish new ]];
              items: BexShape symbols;
		      padding: (BlInsets all: 10) ]);
		  icon: BrGlamorousIcons menu;
		  label: graphTool symbol.
]

{ #category : #accessing }
BexSketchApp >> makeUI [
  ui := super makeUI.
  dockHolder
    addDockable: self makeDebugger as: #debugger in: #rightDock;
    addDockable: self makeInspector as: #inspector in: #rightDock;
    addDockable: self makeArranger as: #arranger in: #rightDock.
  toolbar addChildren: {
    self makeSymbolDropdown.
    self makeRunButton.
    self makePauseButton}.
  ^ ui
]

{ #category : #accessing }
BexSketchApp >> reset [
  self scene removeChildren.
  rpn reset base: (BexSceneBase new scene: scene)
]

{ #category : #accessing }
BexSketchApp >> rpn [
  ^ rpn
]
