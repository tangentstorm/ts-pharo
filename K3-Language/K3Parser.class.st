"
SmaCC parser for the K3  language.

K3 is a language in the APL family of array-oriented languages. 
There is an open source interpreter compatible with K3 at https://github.com/kevinlawler/kona ... 

"
Class {
	#name : #K3Parser,
	#superclass : #SmaCCParser,
	#category : #'K3-Language'
}

{ #category : #'generated-accessing' }
K3Parser class >> cacheId [
	^'2023-06-13T20:40:16.76-04:00'
]

{ #category : #generated }
K3Parser class >> definitionComment [
"%annotate_tokens;
%root Start;
%prefix K3;
%suffix Node;

<whitespace> : [\ \t\f] ;
<nl> : \r\n|\r|\n ;
<digit> : \d;
<alpha> : [a-zA-Z];
<ident> : <alpha>  (<alpha>|<digit>|[_])*;
<lname> : <ident> ([.] <ident>)*;
<gname> : ([.] <ident>)+;
<prim>  : [\_\+\-\*\%\!\&\|\<\>\=\~\,\^\#\$\?\@\.];
<string>: \""(\\\""|[^""])*\"";
<comment>: /\s[^\r\n]* ;
#<cmd>        : \\ [^\r\n]* ;
#<prim>: [~!@#$%\\^&*+<>|,?=_.\-];
#<adverb> : ['/\\][:]?;
<number> : \-?[0-9]+(\.[0-9]+)? ;
#<builtin> : [_] (bin|di|dv|dvl|draw|gtime|ic|ci|jd|dj|lsq|dot|mul|inv|in|lin
#                |sv|sm|ss|ssr|vs|abs|floor|sin|cos|tan|sinh|cosh|tanh
#                |exp|log|sqr|sqrt);
<symbol> : \`(<ident>|<string>)?;
#<endnote> : [\\][\r?\n]* ;
<command> : [\\][^\r\n]* ;
# monad and augAssign are same syntax but have different meanings
#<monad> : <prim>[:] ;
<assignOp>: <prim>? \: ;
#<numcolon>: \d[:] ;

Start : Code;
Code : Line 'line' * Stmts 'stmts'? Comment 'cmt'? {{}}; #(EndNote|Command)? {{}};
#EndNote : <endnote>;
Line  : Stmts 'stmts'? Comment 'cmt'? <nl> {{}};#(Command)? <nl> {{Line}};
#Command : <command>;
Comment : <comment>;
Stmts: Expr 'expr'? ("";"" Expr 'expr'?)* {{}};
Expr : Chain ; #"":""|Return|Chain;
Chain : Item 'item'+ {{}} ;
Item : (Prim|NumArray |Number |SymArray |Symbol |String |List |IfStmt |WhileStmt |DoStmt|Assign|LValue)+ {{}};
# (Cond|IfStmt|WhileStmt|DoStmt|Assign|<prim>|<monad>|<numcolon>|<builtin>|<adverb>|Lambda|Call|List|<number>|<string>|<symbol>|LValue)+ <monad>?;
NumArray : (Number 'num' Number 'num' +) {{}};
SymArray : (Symbol 'sym' Symbol 'sym' +) {{}};
Number : <number> 'number' {{}} ; 
Symbol : <symbol> {{}} ;
String : <string> {{}} ;
Prim : <prim> {{}} ; 
#Cond : "":["" Block ""]"" {{Cond}};
IfStmt : ""if["" Block 'block' ""]"" {{}};
WhileStmt: ""while["" Block 'block' ""]"" {{}};
DoStmt : ""do["" Block 'block' ""]"" {{}};
List : ""("" Block 'block' "")"" {{}};
Block : Line 'line'* Stmts 'stmts'? {{}} ; 
Assign: LValue 'lv' <assignOp> 'op' Expr 'expr' {{ }}; 
#Assign: LValue 'lv' (<assignOp> 'op')  Expr 'expr' {{}};
LValue: <ident> 'lv' {{ }};
#LValue: Ident 'ident' Call 'call'* {{}};
#Ident : <lname>|<gname> {{}};
#Call : ""["" Block 'args' ""]"" {{}};
#Signature : ""["" <ident> 'arg'? ("";"" <ident> 'arg')* ""]"" {{}};
#Lambda : ""{"" Signature 'sig'? Block 'block' ""}"" {{}};
#Return : "":"" Expr {{Return}};"
]

{ #category : #generated }
K3Parser class >> reduceTable [
^#(
	#(20 0 #reduceActionForLine__line___1: 925697 false) 
	#(18 1 #liftFirstValue: 904193 false) 
	#(25 0 #reduceActionFor_____Expr__expr____1: 1167361 false) 
	#(45 0 #reduceActionForLine__line___1: 1936385 false) 
	#(21 1 #reduceActionForLine1: 1026049 false) 
	#(47 1 #reduceActionForLValue1: 2092033 false) 
	#(39 1 #reduceActionForPrim1: 1711105 false) 
	#(38 1 #reduceActionForString1: 1684481 false) 
	#(22 1 #liftFirstValue: 1125377 false) 
	#(36 1 #reduceActionForNumber1: 1622017 false) 
	#(37 1 #reduceActionForSymbol1: 1657857 false) 
	#(20 2 #reduceActionForLine__line___2: 925698 false) 
	#(19 2 #reduceActionForCode2: 918530 false) 
	#(19 2 #reduceActionForCode3: 918531 false) 
	#(23 1 #reduceActionForStmts1: 1146881 false) 
	#(26 1 #liftFirstValue: 1195009 false) 
	#(27 1 #reduceActionForChain1: 1229825 false) 
	#(28 1 #reduceActionForItem__item__1: 1238017 false) 
	#(31 1 #liftFirstValue: 1266689 false) 
	#(29 1 #reduceActionForItem1: 1259521 false) 
	#(30 1 #liftFirstValue: 1266690 false) 
	#(30 1 #liftFirstValue: 1266692 false) 
	#(30 1 #liftFirstValue: 1266691 false) 
	#(30 1 #liftFirstValue: 1266693 false) 
	#(30 1 #liftFirstValue: 1266694 false) 
	#(30 1 #liftFirstValue: 1266689 false) 
	#(30 1 #liftFirstValue: 1266696 false) 
	#(30 1 #liftFirstValue: 1266697 false) 
	#(30 1 #liftFirstValue: 1266698 false) 
	#(30 1 #liftFirstValue: 1266695 false) 
	#(30 1 #liftFirstValue: 1266699 false) 
	#(30 1 #liftFirstValue: 1266700 false) 
	#(21 2 #reduceActionForLine2: 1026050 false) 
	#(21 2 #reduceActionForLine3: 1026051 false) 
	#(19 3 #reduceActionForCode4: 918532 false) 
	#(24 1 #reduceActionFor_____Expr__expr___1: 1167361 false) 
	#(25 2 #reduceActionFor_____Expr__expr____2: 1167362 false) 
	#(23 2 #reduceActionForStmts2: 1146882 false) 
	#(28 2 #reduceActionForLine__line___2: 1238018 false) 
	#(31 2 #liftFirstValue: 1266690 false) 
	#(32 2 #reduceActionForNumArray1: 1524737 false) 
	#(33 1 #reduceActionForItem__item__1: 1550337 false) 
	#(34 2 #reduceActionForSymArray1: 1573889 false) 
	#(35 1 #reduceActionForItem__item__1: 1599489 false) 
	#(43 3 #reduceActionForList1: 1892353 false) 
	#(45 2 #reduceActionForLine__line___2: 1936386 false) 
	#(44 2 #reduceActionForBlock2: 1928194 false) 
	#(42 3 #reduceActionForDoStmt1: 1852417 false) 
	#(40 3 #reduceActionForIfStmt1: 1767425 false) 
	#(41 3 #reduceActionForWhileStmt1: 1807361 false) 
	#(21 3 #reduceActionForLine4: 1026052 false) 
	#(24 2 #reduceActionFor_____Expr__expr___2: 1167362 false) 
	#(33 2 #reduceActionForLine__line___2: 1550338 false) 
	#(35 2 #reduceActionForLine__line___2: 1599490 false) 
	#(46 3 #reduceActionForAssign1: 1973249 false)
	).
]

{ #category : #generated }
K3Parser class >> scannerClass [
	^K3Scanner
]

{ #category : #generated }
K3Parser class >> startingStateForStart [
	^ 1
]

{ #category : #generated }
K3Parser class >> symbolNames [
	^ #('"("' '")"' '";"' '"]"' '"do["' '"if["' '"while["' '<whitespace>' '<nl>' '<ident>' '<prim>' '<string>' '<comment>' '<number>' '<symbol>' '<assignOp>' 'B e g i n' 'Start' 'Code' 'Line ''line'' *' 'Line' 'Comment' 'Stmts' '(";" Expr ''expr''?)' '(";" Expr ''expr''?)*' 'Expr' 'Chain' 'Item ''item''+' 'Item' '(Prim|NumArray |Number |SymArray |Symbol |String |List |IfStmt |WhileStmt |DoStmt|Assign|LValue)' '(Prim|NumArray |Number |SymArray |Symbol |String |List |IfStmt |WhileStmt |DoStmt|Assign|LValue)+' 'NumArray' 'Number ''num'' +' 'SymArray' 'Symbol ''sym'' +' 'Number' 'Symbol' 'String' 'Prim' 'IfStmt' 'WhileStmt' 'DoStmt' 'List' 'Block' 'Line ''line''*' 'Assign' 'LValue' 'E O F' 'error')
]

{ #category : #generated }
K3Parser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #K3CodeNode #K3CodeNode #K3CodeNode #OrderedCollection #K3LineNode #SmaCCToken #K3StmtsNode #OrderedCollection #OrderedCollection #K3ChainNode #K3ChainNode #OrderedCollection #K3ItemNode #K3StartNode #K3StartNode #K3NumArrayNode #OrderedCollection #K3SymArrayNode #OrderedCollection #K3NumberNode #K3SymbolNode #K3StringNode #K3PrimNode #K3IfStmtNode #K3WhileStmtNode #K3DoStmtNode #K3ListNode #K3BlockNode #OrderedCollection #K3AssignNode #K3LValueNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
K3Parser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 9 0 18 0 9 0 19 0 17 0 20 0 6 0 48] 
#[0 0 0 0 48] 
#[0 0 10 0 48] 
#[1 0 21 0 1 0 14 0 3 0 25 0 5 0 29 0 6 0 33 0 7 0 37 0 9 0 41 0 10 0 45 0 11 0 49 0 12 0 69 0 13 0 57 0 14 0 61 0 15 0 65 0 21 0 69 0 22 0 73 0 23 0 77 0 25 0 81 0 26 0 81 0 27 0 89 0 28 0 93 0 29 0 101 0 30 0 101 0 31 0 101 0 32 0 101 0 34 0 113 0 36 0 117 0 37 0 101 0 38 0 101 0 39 0 101 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 46 0 149 0 47 0 14 0 48] 
#[1 0 18 0 1 0 18 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 9 0 18 0 10 0 18 0 11 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 153 0 44 0 157 0 45] 
#[1 0 18 0 1 0 18 0 3 0 18 0 4 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 9 0 18 0 10 0 18 0 11 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 161 0 44 0 157 0 45] 
#[1 0 18 0 1 0 18 0 3 0 18 0 4 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 9 0 18 0 10 0 18 0 11 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 165 0 44 0 157 0 45] 
#[1 0 18 0 1 0 18 0 3 0 18 0 4 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 9 0 18 0 10 0 18 0 11 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 169 0 44 0 157 0 45] 
#[0 0 22 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 48] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 38 0 9 0 48] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 50 0 1 0 3 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 173 0 9 0 54 0 48] 
#[1 0 177 0 9 0 181 0 13 0 181 0 22 0 58 0 48] 
#[1 0 62 0 2 0 185 0 3 0 62 0 4 0 62 0 9 0 62 0 13 0 189 0 24 0 62 0 48] 
#[1 0 14 0 2 0 14 0 3 0 14 0 4 0 14 0 9 0 14 0 13 0 193 0 25 0 14 0 48] 
#[0 0 66 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 21 0 1 0 70 0 2 0 70 0 3 0 70 0 4 0 25 0 5 0 29 0 6 0 33 0 7 0 70 0 9 0 41 0 10 0 45 0 11 0 49 0 12 0 70 0 13 0 57 0 14 0 61 0 15 0 197 0 29 0 101 0 30 0 101 0 31 0 101 0 32 0 101 0 34 0 113 0 36 0 117 0 37 0 101 0 38 0 101 0 39 0 101 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 46 0 149 0 47 0 70 0 48] 
#[0 0 74 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 21 0 1 0 82 0 2 0 82 0 3 0 82 0 4 0 25 0 5 0 29 0 6 0 33 0 7 0 82 0 9 0 41 0 10 0 45 0 11 0 49 0 12 0 82 0 13 0 57 0 14 0 61 0 15 0 201 0 30 0 201 0 32 0 201 0 34 0 113 0 36 0 117 0 37 0 201 0 38 0 201 0 39 0 201 0 40 0 201 0 41 0 201 0 42 0 201 0 43 0 201 0 46 0 149 0 47 0 82 0 48] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 90 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 0 94 0 9 0 94 0 10 0 94 0 11 0 94 0 12 0 94 0 13 0 57 0 14 0 94 0 15 0 205 0 33 0 209 0 36 0 94 0 48] 
#[1 0 98 0 1 0 98 0 2 0 98 0 3 0 98 0 4 0 98 0 5 0 98 0 6 0 98 0 7 0 98 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 61 0 15 0 213 0 35 0 217 0 37 0 98 0 48] 
#[0 0 102 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 106 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 122 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 130 0 1 0 130 0 2 0 130 0 3 0 130 0 4 0 130 0 5 0 130 0 6 0 130 0 7 0 130 0 9 0 130 0 10 0 130 0 11 0 130 0 12 0 130 0 13 0 130 0 14 0 130 0 15 0 221 0 16 0 130 0 48] 
#[0 0 225 0 2] 
#[1 0 21 0 1 0 14 0 2 0 14 0 3 0 14 0 4 0 25 0 5 0 29 0 6 0 33 0 7 0 37 0 9 0 41 0 10 0 45 0 11 0 49 0 12 0 233 0 13 0 57 0 14 0 61 0 15 0 229 0 21 0 233 0 22 0 237 0 23 0 77 0 25 0 81 0 26 0 81 0 27 0 89 0 28 0 93 0 29 0 101 0 30 0 101 0 31 0 101 0 32 0 101 0 34 0 113 0 36 0 117 0 37 0 101 0 38 0 101 0 39 0 101 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 46 0 149 0 47] 
#[0 0 241 0 4] 
#[0 0 245 0 4] 
#[0 0 249 0 4] 
#[0 0 134 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 138 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 253 0 9 0 142 0 48] 
#[1 0 21 0 1 0 146 0 2 0 146 0 3 0 146 0 4 0 25 0 5 0 29 0 6 0 33 0 7 0 146 0 9 0 41 0 10 0 45 0 11 0 49 0 12 0 146 0 13 0 57 0 14 0 61 0 15 1 1 0 26 1 1 0 27 0 89 0 28 0 93 0 29 0 101 0 30 0 101 0 31 0 101 0 32 0 101 0 34 0 113 0 36 0 117 0 37 0 101 0 38 0 101 0 39 0 101 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 46 0 149 0 47 0 146 0 48] 
#[0 0 150 0 2 0 3 0 4 0 9 0 13 0 48] 
#[1 0 154 0 2 0 185 0 3 0 154 0 4 0 154 0 9 0 154 0 13 0 189 0 24 0 154 0 48] 
#[0 0 158 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 162 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 166 0 1 0 166 0 2 0 166 0 3 0 166 0 4 0 166 0 5 0 166 0 6 0 166 0 7 0 166 0 9 0 166 0 10 0 166 0 11 0 166 0 12 0 166 0 13 0 57 0 14 0 166 0 15 1 5 0 36 0 166 0 48] 
#[0 0 170 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 174 0 1 0 174 0 2 0 174 0 3 0 174 0 4 0 174 0 5 0 174 0 6 0 174 0 7 0 174 0 9 0 174 0 10 0 174 0 11 0 174 0 12 0 174 0 13 0 174 0 14 0 61 0 15 1 9 0 37 0 174 0 48] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[1 0 21 0 1 0 25 0 5 0 29 0 6 0 33 0 7 0 41 0 10 0 45 0 11 0 49 0 12 0 57 0 14 0 61 0 15 1 13 0 26 1 13 0 27 0 89 0 28 0 93 0 29 0 101 0 30 0 101 0 31 0 101 0 32 0 101 0 34 0 113 0 36 0 117 0 37 0 101 0 38 0 101 0 39 0 101 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 46 0 149 0 47] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 186 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15] 
#[0 0 173 0 9] 
#[1 0 190 0 2 0 190 0 4 0 177 0 9 1 17 0 13 1 17 0 22] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 198 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 202 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 206 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 210 0 2 0 3 0 4 0 9 0 13 0 48] 
#[0 0 214 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 218 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 222 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 48] 
#[0 0 253 0 9]
	).
]

{ #category : #accessing }
K3Parser >> assignExample [ 
  <gtExample>
  ^ K3Parser parse: 'a: abc: 123'.
]

{ #category : #accessing }
K3Parser >> exprExample [ 
  <gtExample>
  ^ K3Parser parse: 'r<5*3'
]

{ #category : #accessing }
K3Parser >> helloExample [
  <gtExample>
  |k3 nl|
  nl := Character linefeed asString.
  k3 := ('f:{[name] `0:,"Hello, ",$name}',nl,'f[`world]',nl).
  ^ K3Parser parse: k3.
]

{ #category : #accessing }
K3Parser >> listExample [ 
  <gtExample>
  ^ K3Parser parse: '(1 2 3;`symbol;"string")'
]

{ #category : #accessing }
K3Parser >> numbersExample [ 
  <gtExample>
  ^ K3Parser parse: '0 -123 4.56 -7.89'.
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForAssign1: nodes [
	| result |
	result := K3AssignNode new.
	result lv: (nodes at: 1).
	result op: (nodes at: 2).
	result expr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForBlock2: nodes [
	| result |
	result := K3BlockNode new.
	result addNodes: (nodes at: 1) to: result lines.
	result stmts: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForChain1: nodes [
	| result |
	result := K3ChainNode new.
	result addNodes: (nodes at: 1) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCode2: nodes [
	| result |
	result := K3CodeNode new.
	result addNodes: (nodes at: 1) to: result lines.
	result cmt: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCode3: nodes [
	| result |
	result := K3CodeNode new.
	result addNodes: (nodes at: 1) to: result lines.
	result stmts: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCode4: nodes [
	| result |
	result := K3CodeNode new.
	result addNodes: (nodes at: 1) to: result lines.
	result stmts: (nodes at: 2).
	result cmt: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForDoStmt1: nodes [
	| result |
	result := K3DoStmtNode new.
	result doLeftBracketToken: (nodes at: 1).
	result block: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForIfStmt1: nodes [
	| result |
	result := K3IfStmtNode new.
	result ifLeftBracketToken: (nodes at: 1).
	result block: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem1: nodes [
	| result |
	result := K3ItemNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem__item__1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLValue1: nodes [
	| result |
	result := K3LValueNode new.
	result lv: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine1: nodes [
	| result |
	result := K3LineNode new.
	result nlToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine2: nodes [
	| result |
	result := K3LineNode new.
	result cmt: (nodes at: 1).
	result nlToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine3: nodes [
	| result |
	result := K3LineNode new.
	result stmts: (nodes at: 1).
	result nlToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine4: nodes [
	| result |
	result := K3LineNode new.
	result stmts: (nodes at: 1).
	result cmt: (nodes at: 2).
	result nlToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine__line___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine__line___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForList1: nodes [
	| result |
	result := K3ListNode new.
	result leftParenToken: (nodes at: 1).
	result block: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForNumArray1: nodes [
	| result |
	result := K3NumArrayNode new.
	result addNode: (nodes at: 1) to: result nums.
	result addNodes: (nodes at: 2) to: result nums.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForNumber1: nodes [
	| result |
	result := K3NumberNode new.
	result number: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForPrim1: nodes [
	| result |
	result := K3PrimNode new.
	result primToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForStmts1: nodes [
	| result |
	result := K3StmtsNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 1) at: 2) to: result exprs.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForStmts2: nodes [
	| result |
	result := K3StmtsNode new.
	result addNode: (nodes at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result exprs.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForString1: nodes [
	| result |
	result := K3StringNode new.
	result stringToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForSymArray1: nodes [
	| result |
	result := K3SymArrayNode new.
	result addNode: (nodes at: 1) to: result syms.
	result addNodes: (nodes at: 2) to: result syms.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForSymbol1: nodes [
	| result |
	result := K3SymbolNode new.
	result symbolToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForWhileStmt1: nodes [
	| result |
	result := K3WhileStmtNode new.
	result whileLeftBracketToken: (nodes at: 1).
	result block: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Expr__expr___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Expr__expr___2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Expr__expr____1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Expr__expr____2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #accessing }
K3Parser >> stmtsExample [ 
  <gtExample>
  ^ K3Parser parse: 'if[r:1
  do[n:3; i:0; while[i<n;r,:i;i+:1]]]'
]

{ #category : #accessing }
K3Parser >> symbolsExample [ 
  <gtExample>
  ^ K3Parser parse: '` `apple `"banana cream pie"'
]
