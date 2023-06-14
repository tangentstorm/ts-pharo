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
	^'2023-06-13T21:01:51.784-04:00'
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
#<prim>  : [\_\+\-\*\%\!\&\|\<\>\=\~\,\^\#\$\?\@\.];
<prim>: [~!@#$%\\^&*+<>|,?=_.\-];
<string>: \""(\\\""|[^""])*\"";
<comment>: /\s[^\r\n]* ;
#<cmd>        : \\ [^\r\n]* ;
<adverb> : ['/\\][:]?;
<number> : \-?[0-9]+(\.[0-9]+)? ;
#<builtin> : [_] (bin|di|dv|dvl|draw|gtime|ic|ci|jd|dj|lsq|dot|mul|inv|in|lin
#                |sv|sm|ss|ssr|vs|abs|floor|sin|cos|tan|sinh|cosh|tanh
#                |exp|log|sqr|sqrt);
<symbol> : \`(<ident>|<string>)?;
#<endnote> : [\\][\r?\n]* ;
<command> : [\\][^\r\n]* ;
# monad and augAssign are same syntax but have different meanings
#<monad> : <prim>[:] ;
<assignOp>: <prim>?[:];
<numcolon>: \d[:];

Start : Code;
Code : Line 'line' * Stmts 'stmts'? Comment 'cmt'? {{}}; #(EndNote|Command)? {{}};
#EndNote : <endnote>;
Line  : Stmts 'stmts'? Comment 'cmt'? <nl> {{}};#(Command)? <nl> {{Line}};
#Command : <command>;
Comment : <comment>;
Stmts: Expr 'expr'? ("";"" Expr 'expr'?)* {{}};
Expr : Chain ; #"":""|Return|Chain;
Chain : Item 'item'+ {{}} ;
Item : (Prim|NumColon| NumArray |Number |SymArray |Symbol |String |List |IfStmt |WhileStmt |DoStmt|Lambda|LValue|Assign);
# (Cond|IfStmt|WhileStmt|DoStmt|Assign|<prim>|<monad>|<numcolon>|<builtin>|<adverb>|Lambda|Call|List|<number>|<string>|<symbol>|LValue)+ <monad>?;
NumArray : (Number 'num' Number 'num' +) {{}};
SymArray : (Symbol 'sym' Symbol 'sym' +) {{}};
Number : <number> 'number' {{}} ; 
Symbol : <symbol> {{}} ;
String : <string> {{}} ;
NumColon: <numcolon> {{}} ;
Prim : <prim> {{}} ; 
Adverb : <adverb> {{}} ; 
#Cond : "":["" Block ""]"" {{Cond}};
IfStmt : ""if["" Block 'block' ""]"" {{}};
WhileStmt: ""while["" Block 'block' ""]"" {{}};
DoStmt : ""do["" Block 'block' ""]"" {{}};
List : ""("" Block 'block' "")"" {{}};
Block : Line 'line'* Stmts 'stmts'? {{}} ; 
Assign: LValue 'lv' <assignOp> 'op' Expr 'expr' {{}}; 
LValue : <ident> 'ident' Call 'call'* {{ }};
#LValue: Ident 'ident' Call 'call'* {{}};
#Ident : <lname>|<gname> {{}};
Call : ""["" Block 'args' ""]"" {{}};
Signature : ""["" <ident> 'arg'? ("";"" <ident> 'arg')* ""]"" {{}};
Lambda : ""{"" Signature 'sig'? Block 'block' ""}"" {{}};
#Return : "":"" Expr {{Return}};"
]

{ #category : #generated }
K3Parser class >> reduceTable [
^#(
	#(25 0 #reduceActionForLine__line___1: 921601 false) 
	#(23 1 #liftFirstValue: 900097 false) 
	#(30 0 #reduceActionFor_____Expr__expr____1: 1163265 false) 
	#(50 0 #reduceActionForLine__line___1: 2000897 false) 
	#(26 1 #reduceActionForLine1: 1021953 false) 
	#(53 0 #reduceActionForLine__line___1: 2120705 false) 
	#(43 1 #reduceActionForPrim1: 1747969 false) 
	#(41 1 #reduceActionForString1: 1691649 false) 
	#(27 1 #liftFirstValue: 1121281 false) 
	#(39 1 #reduceActionForNumber1: 1629185 false) 
	#(40 1 #reduceActionForSymbol1: 1665025 false) 
	#(42 1 #reduceActionForNumColon1: 1718273 false) 
	#(25 2 #reduceActionForLine__line___2: 921602 false) 
	#(24 2 #reduceActionForCode2: 914434 false) 
	#(24 2 #reduceActionForCode3: 914435 false) 
	#(28 1 #reduceActionForStmts1: 1142785 false) 
	#(31 1 #liftFirstValue: 1190913 false) 
	#(32 1 #reduceActionForChain1: 1225729 false) 
	#(33 1 #reduceActionForItem__item__1: 1233921 false) 
	#(34 1 #liftFirstValue: 1255427 false) 
	#(34 1 #liftFirstValue: 1255429 false) 
	#(34 1 #liftFirstValue: 1255428 false) 
	#(34 1 #liftFirstValue: 1255430 false) 
	#(34 1 #liftFirstValue: 1255431 false) 
	#(34 1 #liftFirstValue: 1255426 false) 
	#(34 1 #liftFirstValue: 1255425 false) 
	#(34 1 #liftFirstValue: 1255433 false) 
	#(34 1 #liftFirstValue: 1255434 false) 
	#(34 1 #liftFirstValue: 1255435 false) 
	#(34 1 #liftFirstValue: 1255432 false) 
	#(34 1 #liftFirstValue: 1255438 false) 
	#(34 1 #liftFirstValue: 1255437 false) 
	#(34 1 #liftFirstValue: 1255436 false) 
	#(49 1 #reduceActionForBlock1: 1992705 false) 
	#(57 0 #reduceActionFor_____Expr__expr____1: 2283521 false) 
	#(52 2 #reduceActionForLValue1: 2095105 false) 
	#(26 2 #reduceActionForLine2: 1021954 false) 
	#(26 2 #reduceActionForLine3: 1021955 false) 
	#(24 3 #reduceActionForCode4: 914436 false) 
	#(29 1 #reduceActionFor_____Expr__expr___1: 1163265 false) 
	#(30 2 #reduceActionFor_____Expr__expr____2: 1163266 false) 
	#(28 2 #reduceActionForStmts2: 1142786 false) 
	#(33 2 #reduceActionForLine__line___2: 1233922 false) 
	#(35 2 #reduceActionForNumArray1: 1531905 false) 
	#(36 1 #reduceActionForItem__item__1: 1557505 false) 
	#(37 2 #reduceActionForSymArray1: 1581057 false) 
	#(38 1 #reduceActionForItem__item__1: 1606657 false) 
	#(48 3 #reduceActionForList1: 1956865 false) 
	#(50 2 #reduceActionForLine__line___2: 2000898 false) 
	#(49 2 #reduceActionForBlock2: 1992706 false) 
	#(47 3 #reduceActionForDoStmt1: 1916929 false) 
	#(45 3 #reduceActionForIfStmt1: 1831937 false) 
	#(46 3 #reduceActionForWhileStmt1: 1871873 false) 
	#(58 3 #reduceActionForLambda1: 2315265 false) 
	#(53 2 #reduceActionForLine__line___2: 2120706 false) 
	#(26 3 #reduceActionForLine4: 1021956 false) 
	#(29 2 #reduceActionFor_____Expr__expr___2: 1163266 false) 
	#(36 2 #reduceActionForLine__line___2: 1557506 false) 
	#(38 2 #reduceActionForLine__line___2: 1606658 false) 
	#(51 3 #reduceActionForAssign1: 2037761 false) 
	#(55 3 #reduceActionForSignature1: 2251777 false) 
	#(57 2 #reduceActionFor_____Expr__expr____2: 2283522 false) 
	#(58 4 #reduceActionForLambda2: 2315266 false) 
	#(55 4 #reduceActionForSignature2: 2251778 false) 
	#(56 2 #reduceActionFor_____Expr__expr___2: 2283521 false) 
	#(54 3 #reduceActionForCall1: 2216961 false)
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
	^ #('"("' '")"' '";"' '"["' '"]"' '"do["' '"if["' '"while["' '"{"' '"}"' '<whitespace>' '<nl>' '<ident>' '<prim>' '<string>' '<comment>' '<adverb>' '<number>' '<symbol>' '<assignOp>' '<numcolon>' 'B e g i n' 'Start' 'Code' 'Line ''line'' *' 'Line' 'Comment' 'Stmts' '(";" Expr ''expr''?)' '(";" Expr ''expr''?)*' 'Expr' 'Chain' 'Item ''item''+' 'Item' 'NumArray' 'Number ''num'' +' 'SymArray' 'Symbol ''sym'' +' 'Number' 'Symbol' 'String' 'NumColon' 'Prim' 'Adverb' 'IfStmt' 'WhileStmt' 'DoStmt' 'List' 'Block' 'Line ''line''*' 'Assign' 'LValue' 'Call ''call''*' 'Call' 'Signature' '(";" <ident> ''arg'')' '(";" <ident> ''arg'')*' 'Lambda' 'E O F' 'error')
]

{ #category : #generated }
K3Parser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #K3CodeNode #K3CodeNode #K3CodeNode #OrderedCollection #K3LineNode #SmaCCToken #K3StmtsNode #OrderedCollection #OrderedCollection #K3ChainNode #K3ChainNode #OrderedCollection #K3StartNode #K3NumArrayNode #OrderedCollection #K3SymArrayNode #OrderedCollection #K3NumberNode #K3SymbolNode #K3StringNode #K3NumColonNode #K3PrimNode #K3AdverbNode #K3IfStmtNode #K3WhileStmtNode #K3DoStmtNode #K3ListNode #K3BlockNode #OrderedCollection #K3AssignNode #K3LValueNode #OrderedCollection #K3CallNode #K3SignatureNode #OrderedCollection #OrderedCollection #K3LambdaNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
K3Parser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 6 0 16 0 6 0 18 0 6 0 19 0 6 0 21 0 9 0 23 0 9 0 24 0 17 0 25 0 6 0 59] 
#[0 0 0 0 59] 
#[0 0 10 0 59] 
#[1 0 21 0 1 0 14 0 3 0 25 0 6 0 29 0 7 0 33 0 8 0 37 0 9 0 41 0 12 0 45 0 13 0 49 0 14 0 53 0 15 0 77 0 16 0 61 0 18 0 65 0 19 0 69 0 21 0 73 0 26 0 77 0 27 0 81 0 28 0 85 0 30 0 89 0 31 0 89 0 32 0 97 0 33 0 101 0 34 0 101 0 35 0 101 0 37 0 113 0 39 0 117 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 45 0 101 0 46 0 101 0 47 0 101 0 48 0 101 0 51 0 153 0 52 0 101 0 58 0 14 0 59] 
#[1 0 18 0 1 0 18 0 2 0 18 0 3 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 0 161 0 49 0 165 0 50] 
#[1 0 18 0 1 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 0 169 0 49 0 165 0 50] 
#[1 0 18 0 1 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 0 173 0 49 0 165 0 50] 
#[1 0 18 0 1 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 0 177 0 49 0 165 0 50] 
#[1 0 18 0 1 0 18 0 3 0 181 0 4 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 10 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 0 185 0 49 0 165 0 50 0 189 0 55] 
#[0 0 22 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 26 0 1 0 26 0 2 0 26 0 3 0 26 0 4 0 26 0 5 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 12 0 26 0 13 0 26 0 14 0 26 0 15 0 26 0 16 0 26 0 18 0 26 0 19 0 26 0 20 0 26 0 21 0 193 0 53 0 26 0 59] 
#[0 0 30 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 34 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 38 0 12 0 59] 
#[0 0 42 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 46 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 50 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 54 0 1 0 3 0 6 0 7 0 8 0 9 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 197 0 12 0 58 0 59] 
#[1 0 201 0 12 0 205 0 16 0 205 0 27 0 62 0 59] 
#[1 0 66 0 2 0 209 0 3 0 66 0 5 0 66 0 10 0 66 0 12 0 66 0 16 0 213 0 29 0 66 0 59] 
#[1 0 14 0 2 0 14 0 3 0 14 0 5 0 14 0 10 0 14 0 12 0 14 0 16 0 217 0 30 0 14 0 59] 
#[0 0 70 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 21 0 1 0 74 0 2 0 74 0 3 0 74 0 5 0 25 0 6 0 29 0 7 0 33 0 8 0 37 0 9 0 74 0 10 0 74 0 12 0 45 0 13 0 49 0 14 0 53 0 15 0 74 0 16 0 61 0 18 0 65 0 19 0 69 0 21 0 221 0 34 0 221 0 35 0 221 0 37 0 113 0 39 0 117 0 40 0 221 0 41 0 221 0 42 0 221 0 43 0 221 0 45 0 221 0 46 0 221 0 47 0 221 0 48 0 221 0 51 0 153 0 52 0 221 0 58 0 74 0 59] 
#[0 0 78 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 82 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 86 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 90 0 1 0 90 0 2 0 90 0 3 0 90 0 5 0 90 0 6 0 90 0 7 0 90 0 8 0 90 0 9 0 90 0 10 0 90 0 12 0 90 0 13 0 90 0 14 0 90 0 15 0 90 0 16 0 61 0 18 0 90 0 19 0 90 0 21 0 225 0 36 0 229 0 39 0 90 0 59] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 5 0 94 0 6 0 94 0 7 0 94 0 8 0 94 0 9 0 94 0 10 0 94 0 12 0 94 0 13 0 94 0 14 0 94 0 15 0 94 0 16 0 94 0 18 0 65 0 19 0 94 0 21 0 233 0 38 0 237 0 40 0 94 0 59] 
#[0 0 98 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 102 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 106 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 110 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 114 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 118 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 122 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 126 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 130 0 1 0 130 0 2 0 130 0 3 0 130 0 5 0 130 0 6 0 130 0 7 0 130 0 8 0 130 0 9 0 130 0 10 0 130 0 12 0 130 0 13 0 130 0 14 0 130 0 15 0 130 0 16 0 130 0 18 0 130 0 19 0 241 0 20 0 130 0 21 0 130 0 59] 
#[0 0 134 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 245 0 2] 
#[1 0 21 0 1 0 138 0 2 0 14 0 3 0 138 0 5 0 25 0 6 0 29 0 7 0 33 0 8 0 37 0 9 0 138 0 10 0 41 0 12 0 45 0 13 0 49 0 14 0 53 0 15 0 253 0 16 0 61 0 18 0 65 0 19 0 69 0 21 0 249 0 26 0 253 0 27 1 1 0 28 0 85 0 30 0 89 0 31 0 89 0 32 0 97 0 33 0 101 0 34 0 101 0 35 0 101 0 37 0 113 0 39 0 117 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 45 0 101 0 46 0 101 0 47 0 101 0 48 0 101 0 51 0 153 0 52 0 101 0 58] 
#[0 1 5 0 5] 
#[0 1 9 0 5] 
#[0 1 13 0 5] 
#[1 0 142 0 3 0 142 0 5 1 17 0 13 1 21 0 57] 
#[0 1 25 0 10] 
#[1 0 18 0 1 0 18 0 3 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 10 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 1 29 0 49 0 165 0 50] 
#[1 0 146 0 1 0 146 0 2 0 146 0 3 1 33 0 4 0 146 0 5 0 146 0 6 0 146 0 7 0 146 0 8 0 146 0 9 0 146 0 10 0 146 0 12 0 146 0 13 0 146 0 14 0 146 0 15 0 146 0 16 0 146 0 18 0 146 0 19 0 146 0 20 0 146 0 21 1 37 0 54 0 146 0 59] 
#[0 0 150 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 154 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 1 41 0 12 0 158 0 59] 
#[1 0 21 0 1 0 162 0 2 0 162 0 3 0 162 0 5 0 25 0 6 0 29 0 7 0 33 0 8 0 37 0 9 0 162 0 10 0 162 0 12 0 45 0 13 0 49 0 14 0 53 0 15 0 162 0 16 0 61 0 18 0 65 0 19 0 69 0 21 1 45 0 31 1 45 0 32 0 97 0 33 0 101 0 34 0 101 0 35 0 101 0 37 0 113 0 39 0 117 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 45 0 101 0 46 0 101 0 47 0 101 0 48 0 101 0 51 0 153 0 52 0 101 0 58 0 162 0 59] 
#[0 0 166 0 2 0 3 0 5 0 10 0 12 0 16 0 59] 
#[1 0 170 0 2 0 209 0 3 0 170 0 5 0 170 0 10 0 170 0 12 0 170 0 16 0 213 0 29 0 170 0 59] 
#[0 0 174 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 178 0 1 0 178 0 2 0 178 0 3 0 178 0 5 0 178 0 6 0 178 0 7 0 178 0 8 0 178 0 9 0 178 0 10 0 178 0 12 0 178 0 13 0 178 0 14 0 178 0 15 0 178 0 16 0 61 0 18 0 178 0 19 0 178 0 21 1 49 0 39 0 178 0 59] 
#[0 0 182 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 186 0 1 0 186 0 2 0 186 0 3 0 186 0 5 0 186 0 6 0 186 0 7 0 186 0 8 0 186 0 9 0 186 0 10 0 186 0 12 0 186 0 13 0 186 0 14 0 186 0 15 0 186 0 16 0 186 0 18 0 65 0 19 0 186 0 21 1 53 0 40 0 186 0 59] 
#[0 0 190 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 21 0 1 0 25 0 6 0 29 0 7 0 33 0 8 0 37 0 9 0 45 0 13 0 49 0 14 0 53 0 15 0 61 0 18 0 65 0 19 0 69 0 21 1 57 0 31 1 57 0 32 0 97 0 33 0 101 0 34 0 101 0 35 0 101 0 37 0 113 0 39 0 117 0 40 0 101 0 41 0 101 0 42 0 101 0 43 0 101 0 45 0 101 0 46 0 101 0 47 0 101 0 48 0 101 0 51 0 153 0 52 0 101 0 58] 
#[0 0 194 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 198 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21] 
#[0 0 197 0 12] 
#[1 0 202 0 2 0 202 0 5 0 202 0 10 0 201 0 12 1 61 0 16 1 61 0 27] 
#[0 0 206 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 210 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 214 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[1 0 142 0 3 0 142 0 5 1 65 0 57] 
#[1 1 69 0 3 1 73 0 5 1 77 0 56] 
#[0 0 218 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 1 81 0 10] 
#[1 0 18 0 1 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 7 0 18 0 8 0 18 0 9 0 18 0 12 0 18 0 13 0 18 0 14 0 18 0 15 0 18 0 16 0 18 0 18 0 18 0 19 0 18 0 21 1 85 0 49 0 165 0 50] 
#[0 0 222 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 59] 
#[0 0 226 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 230 0 2 0 3 0 5 0 10 0 12 0 16 0 59] 
#[0 0 234 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 238 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 0 242 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 1 41 0 12] 
#[1 1 69 0 3 1 89 0 5 1 77 0 56] 
#[0 1 93 0 13] 
#[0 0 246 0 1 0 3 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21] 
#[0 0 250 0 3 0 5] 
#[0 0 254 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 59] 
#[0 1 97 0 5] 
#[0 1 2 0 1 0 3 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21] 
#[0 1 6 0 3 0 5] 
#[0 1 10 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 59]
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
  k3 :=
'f:{[name] `0:,"Hello, ",$name}
 f[`world]'.
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
K3Parser >> reduceActionForBlock1: nodes [
	| result |
	result := K3BlockNode new.
	result addNodes: (nodes at: 1) to: result lines.
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
K3Parser >> reduceActionForCall1: nodes [
	| result |
	result := K3CallNode new.
	result leftBracketToken: (nodes at: 1).
	result args: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
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
	result ident: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result calls.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLambda1: nodes [
	| result |
	result := K3LambdaNode new.
	result leftBraceToken: (nodes at: 1).
	result block: (nodes at: 2).
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLambda2: nodes [
	| result |
	result := K3LambdaNode new.
	result leftBraceToken: (nodes at: 1).
	result sig: (nodes at: 2).
	result block: (nodes at: 3).
	result rightBraceToken: (nodes at: 4).
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
K3Parser >> reduceActionForNumColon1: nodes [
	| result |
	result := K3NumColonNode new.
	result numcolonToken: (nodes at: 1).
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
K3Parser >> reduceActionForSignature1: nodes [
	| result |
	result := K3SignatureNode new.
	result leftBracketToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result semicolonTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result args.
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForSignature2: nodes [
	| result |
	result := K3SignatureNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result args.
	result addTokens: ((nodes at: 3) at: 1) to: result semicolonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result args.
	result rightBracketToken: (nodes at: 4).
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
