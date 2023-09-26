Class {
	#name : #BexSketchApp,
	#superclass : #GsToolApp,
	#instVars : [
		'graphTool',
		'arranger'
	],
	#category : #'Bex-Apps'
}

{ #category : #accessing }
BexSketchApp >> initialTools [
  ^ { GsSelectTool new.
  	graphTool := BexGraphTool new symbol: #x0. }
]

{ #category : #accessing }
BexSketchApp >> initialize [
  super initialize.
  self currentTool: graphTool.
  self scene size: 1920@1080; gsFill: '#5588bb'
]

{ #category : #accessing }
BexSketchApp >> makeArranger [
  ^ arranger := GsArrangePanel new
    selection: selection.
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
    addDockable: self makeInspector as: #inspector in: #rightDock;
    addDockable: self makeArranger as: #arranger in: #rightDock.
  toolbar addChild: (self makeSymbolDropdown).
  ^ ui
]
