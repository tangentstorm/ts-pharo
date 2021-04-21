Class {
	#name : #ViewBexParser,
	#superclass : #SmaCCParser,
	#category : #'Bex-Debug'
}

{ #category : #'generated-accessing' }
ViewBexParser class >> cacheId [
	^'2021-04-21T10:23:19.514794-04:00'
]

{ #category : #generated }
ViewBexParser class >> definitionComment [
"%annotate_tokens;
%prefix ViewBexAST;
%suffix Node;
%root Start;

Start 
  : <header> 'label'
    ""$"" Vars 'dvars'
    ""%"" Vars 'mvars'
    Row 'row' +
  {{}};

Vid : (<var> | <vir>| <nov>) ;
Vars : ""["" Vid 'vid' ("","" Vid 'vid')* ""]"" {{}} ;
Ref
  : ""XO"" 'nid' {{}}
  | ""XI"" 'nid' {{}} 
  | ""!"" 'inv'? ""#"" <num> 'nid' {{}} ;
Row : <ix> 'ix' Vid 'vid' Ref 'hi' Ref'lo' ""(rc:"" <num> 'rc' "")"" {{}};


<header> : :[^\r\n]+ ;
<ix>  : \^\d+: ;
<var> : x\d+ ;
<vir> : v\d+ ;
<nov> : NoV ;
<num> : \d+ ;
<whitespace> : \s+ ;"
]

{ #category : #generated }
ViewBexParser class >> reduceTable [
^#(
	#(22 1 #liftFirstValue: 176129 false ) 
	#(22 1 #liftFirstValue: 176130 false ) 
	#(22 1 #liftFirstValue: 176131 false ) 
	#(25 0 #reduceActionFor_____Vid__vid___1: 229377 false ) 
	#(23 4 #reduceActionForVars1: 207873 false ) 
	#(25 2 #reduceActionFor_____Vid__vid___2: 229378 false ) 
	#(20 6 #reduceActionForStart1: 73729 false ) 
	#(21 1 #reduceActionForRow__row___1: 152577 false ) 
	#(24 2 #reduceActionFor_____Vid__vid__1: 229377 false ) 
	#(21 2 #reduceActionForRow__row___2: 152578 false ) 
	#(26 1 #reduceActionForRef2: 259074 false ) 
	#(26 1 #reduceActionForRef2: 259073 false ) 
	#(26 2 #reduceActionForRef3: 259075 false ) 
	#(26 3 #reduceActionForRef4: 259076 false ) 
	#(27 7 #reduceActionForRow1: 348161 false )
	).
]

{ #category : #generated }
ViewBexParser class >> scannerClass [
	^ViewBexScanner
]

{ #category : #accessing }
ViewBexParser class >> simpleExample [
  <gtExample>
  |src|
  src := {
    ': example tree'.
    '$[ v2, v1, v0 ]'.
    '%[ v2, v1, v0 ]'.
    '^00: NoV XO XI (rc:0)'.
    '^01: v2 #03 !#02 (rc:1)'.
    '^02: v1 XO XI (rc:1)'.
    '^03: v0 XO XI (rc:1)'.
  } joinUsing: (Character linefeed).
  ^ ViewBexParser parse: src
]

{ #category : #generated }
ViewBexParser class >> startingStateForStart [
	^ 1
]

{ #category : #generated }
ViewBexParser class >> symbolNames [
	^ #('"!"' '"#"' '"$"' '"%"' '"(rc:"' '")"' '","' '"XI"' '"XO"' '"["' '"]"' '<header>' '<ix>' '<var>' '<vir>' '<nov>' '<num>' '<whitespace>' 'B e g i n' 'Start' 'Row ''row'' +' 'Vid' 'Vars' '("," Vid ''vid'')' '("," Vid ''vid'')*' 'Ref' 'Row' 'E O F' 'error')
]

{ #category : #generated }
ViewBexParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #ViewBexASTStartNode #ViewBexASTStartNode #OrderedCollection #SmaCCToken #ViewBexASTVarsNode #OrderedCollection #OrderedCollection #ViewBexASTRefNode #ViewBexASTRowNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
ViewBexParser class >> transitionTable [
^#(
#[1 0 9 0 12 0 13 0 20] 
#[0 0 17 0 3] 
#[0 0 0 0 28] 
#[1 0 21 0 10 0 25 0 23] 
#[0 0 41 0 14 0 15 0 16 0 22] 
#[0 0 45 0 4] 
#[0 0 6 0 1 0 2 0 7 0 8 0 9 0 11] 
#[0 0 10 0 1 0 2 0 7 0 8 0 9 0 11] 
#[0 0 14 0 1 0 2 0 7 0 8 0 9 0 11] 
#[1 0 18 0 7 0 18 0 11 0 49 0 25] 
#[1 0 21 0 10 0 53 0 23] 
#[1 0 57 0 7 0 61 0 11 0 65 0 24] 
#[1 0 69 0 13 0 73 0 21 0 77 0 27] 
#[0 0 81 0 14 0 15 0 16 0 22] 
#[0 0 22 0 4 0 13] 
#[0 0 26 0 7 0 11] 
#[0 0 85 0 14 0 15 0 16 0 22] 
#[1 0 69 0 13 0 89 0 27 0 30 0 28] 
#[0 0 34 0 13 0 28] 
#[0 0 38 0 7 0 11] 
#[1 0 93 0 1 0 97 0 2 0 101 0 8 0 105 0 9 0 109 0 26] 
#[0 0 42 0 13 0 28] 
#[0 0 113 0 2] 
#[0 0 117 0 17] 
#[0 0 46 0 1 0 2 0 5 0 8 0 9] 
#[0 0 50 0 1 0 2 0 5 0 8 0 9] 
#[1 0 93 0 1 0 97 0 2 0 101 0 8 0 105 0 9 0 121 0 26] 
#[0 0 125 0 17] 
#[0 0 54 0 1 0 2 0 5 0 8 0 9] 
#[0 0 129 0 5] 
#[0 0 58 0 1 0 2 0 5 0 8 0 9] 
#[0 0 133 0 17] 
#[0 0 137 0 6] 
#[0 0 62 0 13 0 28]
	).
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRef2: nodes [
	| result |
	result := ViewBexASTRefNode new.
	result nid: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRef3: nodes [
	| result |
	result := ViewBexASTRefNode new.
	result _Token: (nodes at: 1).
	result nid: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRef4: nodes [
	| result |
	result := ViewBexASTRefNode new.
	result inv: (nodes at: 1).
	result _Token: (nodes at: 2).
	result nid: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRow1: nodes [
	| result |
	result := ViewBexASTRowNode new.
	result ix: (nodes at: 1).
	result vid: (nodes at: 2).
	result hi: (nodes at: 3).
	result lo: (nodes at: 4).
	result leftParenrcColonToken: (nodes at: 5).
	result rc: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRow__row___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForRow__row___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForStart1: nodes [
	| result |
	result := ViewBexASTStartNode new.
	result label: (nodes at: 1).
	result _Token: (nodes at: 2).
	result dvars: (nodes at: 3).
	result percentToken: (nodes at: 4).
	result mvars: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result rows.
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionForVars1: nodes [
	| result |
	result := ViewBexASTVarsNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result vids.
	result addTokens: ((nodes at: 3) at: 1) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result vids.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionFor_____Vid__vid__1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionFor_____Vid__vid___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
ViewBexParser >> reduceActionFor_____Vid__vid___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]
