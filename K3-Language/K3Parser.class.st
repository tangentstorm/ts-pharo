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
	^'2021-04-17T19:03:59.679736-04:00'
]

{ #category : #generated }
K3Parser class >> definitionComment [
"%annotate_tokens;
%root Start;
%prefix K3;
%suffix Node;

<whitespace> : [\ \t\f] ;
<nl>         : \r? \n ; 
<comment>        : / [^\r\n]* ;
<cmd>        : \\ [^\r\n]* ;
<prim>: ([~!@#$%\\^&*+<>|,?=_.\-] [:]?) | (\d:);
<adv> : ( ' | ': | '/:' | \\: );

<num> : \-?[0-9]+(\.[0-9]+)? ;

<builtin> : [_] (bin|di|dv|dvl|draw|gtime|ic|ci|jd|dj|lsq|dot|mul|inv|in|lin
                |sv|sm|ss|ssr|vs|abs|floor|sin|cos|tan|sinh|cosh|tanh
                |exp|log|sqr|sqrt);

<ident>: [_a-zA-Z.]+ ;
<str> : ""[^""]*"" ;
<sym> : `(<ident>|<str>)?;

Start : Block ;
Block : Line* Code? {{Block}} ; 
Line  : Item <nl> {{Line}};
Item  : Code? <comment>? {{CodeItem}}
      | <cmd> {{CmdItem}};
Code  : Stmt? ("";"" Stmt)* {{Code}};
Stmt  : IfStmt | DoStmt | WhileStmt | Expr ;
Expr  : Head+ Tail {{Expr}} ;
Head  : <ident>  
      | <adv>
      | <prim> 
      | <builtin>
      | <str>    {{String}}
      | (<num>+) {{NumStrand}}
      | (<sym>+) {{SymStrand}}
      | List
      | Dict
      | <ident> "":"" Expr {{Def}}
      | ""("" Expr "")"" 
      | Lambda
      | Cond 
      ;

Lambda: ""{"" Sig? Block ""}"" {{Lambda}};
Sig   : ""["" (<ident> ("";"" <ident>)*)? ""]"";

List  : ""("" Block "")"" {{List}};
Dict  : "".("" Entry* "")"" ;
Entry : ""("" Expr "";"" Expr ("";"" Expr?)? "")"";

Tail  : (""["" Block ""]"")* (<adv>)* ;
Amend : "".["" Block ""]"" ;
Cond  : "":["" Block ""]"" ;
IfStmt: ""if["" Block ""]"" ;
DoStmt: ""do["" Block ""]"" ;
WhileStmt: ""while["" Block ""]"" ;"
]

{ #category : #generated }
K3Parser class >> reduceTable [
^#(
	#(29 0 #nil 600065 false ) 
	#(27 1 #liftFirstValue: 574465 false ) 
	#(28 1 #reduceActionForBlock1: 591873 false ) 
	#(34 0 #reduceActionFor_____Stmt__1: 739329 false ) 
	#(31 0 #reduceActionForItem1: 656385 false ) 
	#(47 0 #reduceActionFor_____Stmt__1: 1268737 false ) 
	#(31 1 #reduceActionForItem2: 656386 false ) 
	#(31 1 #reduceActionForItem5: 656389 false ) 
	#(38 1 #liftFirstValue: 839683 false ) 
	#(38 1 #liftFirstValue: 839682 false ) 
	#(39 1 #reduceActionFor_num__1: 950273 false ) 
	#(38 1 #liftFirstValue: 839684 false ) 
	#(38 1 #liftFirstValue: 839681 false ) 
	#(38 1 #reduceActionForHead5: 839685 false ) 
	#(40 1 #reduceActionFor_num__1: 983041 false ) 
	#(29 2 #liftFirstValue: 600066 false ) 
	#(28 2 #reduceActionForBlock1: 591874 false ) 
	#(31 1 #reduceActionForItem1: 656387 false ) 
	#(32 1 #reduceActionForCode1: 724993 false ) 
	#(35 1 #reduceActionFor_____Stmt__1: 761860 false ) 
	#(51 0 #reduceActionFor_____Stmt__1: 1338369 false ) 
	#(37 1 #liftFirstValue: 816129 false ) 
	#(38 1 #reduceActionForHead6: 839686 false ) 
	#(38 1 #reduceActionForHead7: 839687 false ) 
	#(38 1 #liftFirstValue: 839692 false ) 
	#(38 1 #liftFirstValue: 839688 false ) 
	#(38 1 #liftFirstValue: 839689 false ) 
	#(38 1 #liftFirstValue: 839693 false ) 
	#(35 1 #reduceActionForStmt1: 761857 false ) 
	#(35 1 #reduceActionForStmt2: 761858 false ) 
	#(35 1 #reduceActionForStmt3: 761859 false ) 
	#(30 2 #reduceActionForLine1: 626689 false ) 
	#(31 2 #reduceActionForItem4: 656388 false ) 
	#(34 2 #reduceActionFor_____Stmt__2: 739330 false ) 
	#(32 2 #reduceActionForCode2: 724994 false ) 
	#(37 2 #liftFirstValue: 816130 false ) 
	#(36 2 #reduceActionForExpr1: 807937 false ) 
	#(53 0 #reduceActionFor__adv___1: 1355777 false ) 
	#(39 2 #reduceActionFor_num__2: 950274 false ) 
	#(40 2 #reduceActionFor_num__2: 983042 false ) 
	#(45 3 #reduceActionForList1: 1221633 false ) 
	#(38 3 #liftSecondValue: 839691 false ) 
	#(46 3 #reduceActionForDict1: 1255425 false ) 
	#(47 2 #reduceActionForEntry_2: 1268738 false ) 
	#(55 3 #reduceActionForCond1: 1394689 false ) 
	#(57 3 #reduceActionForCond1: 1448961 false ) 
	#(56 3 #reduceActionForIfStmt1: 1421313 false ) 
	#(58 3 #reduceActionForCond1: 1476609 false ) 
	#(42 2 #reduceActionForSig1: 1176577 false ) 
	#(44 0 #reduceActionFor______ident___1: 1198081 false ) 
	#(41 3 #reduceActionForLambda1: 1135617 false ) 
	#(38 3 #reduceActionForHead10: 839690 false ) 
	#(33 2 #reduceActionFor_____Stmt_1: 739329 false ) 
	#(51 2 #reduceActionFor_____Block______2: 1338370 false ) 
	#(49 2 #reduceActionForTail1: 1330177 false ) 
	#(41 4 #reduceActionForLambda2: 1135618 false ) 
	#(52 1 #liftFirstValue: 1355777 false ) 
	#(53 2 #reduceActionFor_num__2: 1355778 false ) 
	#(42 4 #reduceActionForSig2: 1176578 false ) 
	#(44 2 #reduceActionFor______ident___2: 1198082 false ) 
	#(50 3 #reduceActionForCond1: 1338369 false ) 
	#(43 2 #reduceActionFor______ident__1: 1198081 false ) 
	#(48 5 #reduceActionForEntry1: 1282049 false ) 
	#(48 6 #reduceActionForEntry2: 1282050 false ) 
	#(48 7 #reduceActionForEntry3: 1282051 false )
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
	^ #('"("' '")"' '".("' '".["' '":"' '":["' '";"' '"["' '"]"' '"do["' '"if["' '"while["' '"{"' '"}"' '<whitespace>' '<nl>' '<comment>' '<cmd>' '<prim>' '<adv>' '<num>' '<builtin>' '<ident>' '<str>' '<sym>' 'B e g i n' 'Start' 'Block' 'Line*' 'Line' 'Item' 'Code' '(";" Stmt)' '(";" Stmt)*' 'Stmt' 'Expr' 'Head+' 'Head' '<num>+' '<sym>+' 'Lambda' 'Sig' '(";" <ident>)' '(";" <ident>)*' 'List' 'Dict' 'Entry*' 'Entry' 'Tail' '("[" Block "]")' '("[" Block "]")*' '(<adv>)' '(<adv>)*' 'Amend' 'Cond' 'IfStmt' 'DoStmt' 'WhileStmt' 'E O F' 'error')
]

{ #category : #generated }
K3Parser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #K3BlockNode #K3BlockNode #K3BlockNode nil #K3LineNode #K3StartNode #K3CodeNode #OrderedCollection #OrderedCollection #OrderedCollection #K3ExprNode #Object #Object #OrderedCollection #OrderedCollection #K3LambdaNode #OrderedCollection #OrderedCollection #OrderedCollection #K3ListNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #K3BlockNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
K3Parser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 9 0 27 0 9 0 28 0 17 0 29 0 6 0 59] 
#[0 0 0 0 59] 
#[0 0 10 0 59] 
#[1 0 21 0 1 0 14 0 2 0 25 0 3 0 29 0 6 0 18 0 7 0 14 0 9 0 33 0 10 0 37 0 11 0 41 0 12 0 45 0 13 0 14 0 14 0 22 0 16 0 49 0 17 0 53 0 18 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 0 85 0 30 0 89 0 31 0 93 0 32 0 97 0 34 0 101 0 35 0 105 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55 0 141 0 56 0 145 0 57 0 149 0 58 0 14 0 59] 
#[1 0 21 0 1 0 6 0 2 0 25 0 3 0 29 0 6 0 6 0 7 0 6 0 10 0 6 0 11 0 6 0 12 0 45 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 0 153 0 28 0 17 0 29 0 157 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55] 
#[1 0 26 0 1 0 26 0 2 0 161 0 47] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 165 0 28 0 17 0 29] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 169 0 28 0 17 0 29] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 173 0 28 0 17 0 29] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 177 0 28 0 17 0 29] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 181 0 8 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 0 185 0 28 0 17 0 29 0 189 0 42] 
#[0 0 30 0 16] 
#[0 0 34 0 16] 
#[0 0 38 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 42 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 46 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 50 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 54 0 1 0 54 0 2 0 54 0 3 0 193 0 5 0 54 0 6 0 54 0 7 0 54 0 8 0 54 0 9 0 54 0 13 0 54 0 14 0 54 0 16 0 54 0 17 0 54 0 19 0 54 0 20 0 54 0 21 0 54 0 22 0 54 0 23 0 54 0 24 0 54 0 25 0 54 0 59] 
#[0 0 58 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 62 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 66 0 1 0 2 0 3 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 197 0 16] 
#[1 0 70 0 2 0 70 0 9 0 70 0 14 0 74 0 16 0 201 0 17 0 70 0 59] 
#[1 0 78 0 2 0 205 0 7 0 78 0 9 0 78 0 14 0 78 0 16 0 78 0 17 0 209 0 33 0 78 0 59] 
#[1 0 18 0 2 0 18 0 7 0 18 0 9 0 18 0 14 0 18 0 16 0 18 0 17 0 213 0 34 0 18 0 59] 
#[0 0 82 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[1 0 21 0 1 0 86 0 2 0 25 0 3 0 29 0 6 0 86 0 7 0 86 0 8 0 86 0 9 0 45 0 13 0 86 0 14 0 86 0 16 0 86 0 17 0 217 0 19 0 217 0 20 0 65 0 21 0 217 0 22 0 73 0 23 0 77 0 24 0 81 0 25 0 217 0 38 0 117 0 39 0 121 0 40 0 217 0 41 0 217 0 45 0 217 0 46 0 221 0 49 0 225 0 51 0 217 0 55 0 86 0 59] 
#[0 0 90 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 6 0 94 0 7 0 94 0 8 0 94 0 9 0 94 0 13 0 94 0 14 0 94 0 16 0 94 0 17 0 94 0 19 0 94 0 20 0 229 0 21 0 94 0 22 0 94 0 23 0 94 0 24 0 94 0 25 0 94 0 59] 
#[1 0 98 0 1 0 98 0 2 0 98 0 3 0 98 0 6 0 98 0 7 0 98 0 8 0 98 0 9 0 98 0 13 0 98 0 14 0 98 0 16 0 98 0 17 0 98 0 19 0 98 0 20 0 98 0 21 0 98 0 22 0 98 0 23 0 98 0 24 0 233 0 25 0 98 0 59] 
#[0 0 102 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 106 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 110 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 114 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 118 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 122 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 126 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 237 0 2] 
#[0 0 241 0 2] 
#[1 0 245 0 1 0 249 0 2 0 253 0 48] 
#[0 1 1 0 9] 
#[0 1 5 0 9] 
#[0 1 9 0 9] 
#[0 1 13 0 9] 
#[1 1 17 0 9 1 21 0 23] 
#[0 1 25 0 14] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 1 29 0 28 0 17 0 29] 
#[1 0 21 0 1 0 25 0 3 0 29 0 6 0 45 0 13 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 1 33 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55] 
#[0 0 130 0 1 0 2 0 3 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 134 0 16] 
#[1 0 21 0 1 0 25 0 3 0 29 0 6 0 33 0 10 0 37 0 11 0 41 0 12 0 45 0 13 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 1 37 0 35 0 105 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55 0 141 0 56 0 145 0 57 0 149 0 58] 
#[0 0 138 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[1 0 142 0 2 0 205 0 7 0 142 0 9 0 142 0 14 0 142 0 16 0 142 0 17 0 209 0 33 0 142 0 59] 
#[0 0 146 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 150 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 154 0 1 0 154 0 2 0 154 0 3 0 154 0 6 0 154 0 7 1 41 0 8 0 154 0 9 0 154 0 13 0 154 0 14 0 154 0 16 0 154 0 17 0 154 0 19 0 154 0 20 0 154 0 21 0 154 0 22 0 154 0 23 0 154 0 24 0 154 0 25 1 45 0 50 1 49 0 53 0 154 0 59] 
#[0 0 158 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 162 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 166 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 170 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 21 0 1 0 25 0 3 0 29 0 6 0 45 0 13 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 1 53 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55] 
#[0 0 174 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 178 0 1 0 2] 
#[0 0 182 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 186 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 190 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 194 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[0 0 198 0 1 0 3 0 6 0 7 0 10 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25] 
#[1 0 202 0 7 0 202 0 9 1 57 0 44] 
#[0 0 206 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 1 61 0 14] 
#[0 0 210 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 214 0 2 0 7 0 9 0 14 0 16 0 17 0 59] 
#[1 0 6 0 1 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 25 1 65 0 28 0 17 0 29] 
#[0 0 218 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 222 0 1 0 222 0 2 0 222 0 3 0 222 0 6 0 222 0 7 0 222 0 8 0 222 0 9 0 222 0 13 0 222 0 14 0 222 0 16 0 222 0 17 0 222 0 19 1 73 0 20 0 222 0 21 0 222 0 22 0 222 0 23 0 222 0 24 0 222 0 25 1 73 0 52 0 222 0 59] 
#[0 1 77 0 7] 
#[1 1 81 0 7 1 85 0 9 1 89 0 43] 
#[0 0 226 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 1 93 0 9] 
#[0 0 230 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[0 0 234 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 0 21 0 1 0 25 0 3 0 29 0 6 0 45 0 13 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 1 97 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55] 
#[0 1 101 0 23] 
#[0 0 238 0 1 0 3 0 6 0 7 0 10 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25] 
#[0 0 242 0 7 0 9] 
#[0 0 246 0 1 0 2 0 3 0 6 0 7 0 8 0 9 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 59] 
#[1 1 105 0 2 1 109 0 7] 
#[0 0 250 0 7 0 9] 
#[0 0 254 0 1 0 2] 
#[1 0 21 0 1 1 113 0 2 0 25 0 3 0 29 0 6 0 45 0 13 0 109 0 19 0 109 0 20 0 65 0 21 0 109 0 22 0 73 0 23 0 77 0 24 0 81 0 25 1 117 0 36 0 109 0 37 0 109 0 38 0 117 0 39 0 121 0 40 0 109 0 41 0 109 0 45 0 109 0 46 0 109 0 55] 
#[0 1 2 0 1 0 2] 
#[0 1 121 0 2] 
#[0 1 6 0 1 0 2]
	).
]

{ #category : #accessing }
K3Parser >> helloExample [
  <gtExample>
  |k3 nl|
  nl := Character linefeed asString.
  k3 := ('f:{[name] `0:,"Hello, ",$name}',nl,'f[`world]',nl).
  ^ K3Parser parse: k3.
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForBlock1: nodes [
	| result |
	result := K3BlockNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCode1: nodes [
	| result |
	result := K3CodeNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result semicolonTokens.
	result
		addTokens: ((nodes at: 1) at: 2)
		to: result ifLeftBracketTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 1) at: 4)
		to: result doLeftBracketTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result whileLeftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result nlTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result identTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result advTokens.
	result addTokens: ((nodes at: 1) at: 9) to: result primTokens.
	result addTokens: ((nodes at: 1) at: 10) to: result builtinTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result strTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result commentTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result cmdTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result numTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result symTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result periodLeftParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result colonLeftBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCode2: nodes [
	| result |
	result := K3CodeNode new.
	result
		addTokens: ((nodes at: 1) at: 1)
		to: result ifLeftBracketTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result nlTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commentTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result cmdTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolonTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result doLeftBracketTokens.
	result
		addTokens: ((nodes at: 1) at: 8)
		to: result whileLeftBracketTokens.
	result addTokens: ((nodes at: 1) at: 9) to: result identTokens.
	result addTokens: ((nodes at: 1) at: 10) to: result advTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result primTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result builtinTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result strTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result numTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result symTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result periodLeftParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result colonLeftBracketTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result semicolonTokens.
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result ifLeftBracketTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 4)
		to: result doLeftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 5)
		to: result whileLeftBracketTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result nlTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result identTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result advTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result primTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result builtinTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result strTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result commentTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result cmdTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result numTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result symTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result periodLeftParenTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result colonLeftBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForCond1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForDict1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self add: (nodes at: 3) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForEntry1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 12).
	self add: (nodes at: 5) to: (result at: 17).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForEntry2: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 12).
	self add: (nodes at: 5) to: (result at: 12).
	self add: (nodes at: 6) to: (result at: 17).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForEntry3: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 12).
	self add: (nodes at: 5) to: (result at: 12).
	self add: (nodes at: 7) to: (result at: 17).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForEntry_2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 17).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForExpr1: nodes [
	| result |
	result := K3ExprNode new.
	result addTokens: ((nodes at: 2) at: 1) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result nlTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result semicolonTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result commentTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result cmdTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result ifLeftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 8)
		to: result doLeftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 9)
		to: result whileLeftBracketTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result identTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result advTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result primTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result builtinTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result strTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result numTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result symTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result periodLeftParenTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result colonLeftBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForHead10: nodes [
	| result |
	result := K3DefNode new.
	result addToken: (nodes at: 1) to: result identTokens.
	result addToken: (nodes at: 2) to: result colonTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForHead5: nodes [
	| result |
	result := K3StringNode new.
	result strToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForHead6: nodes [
	| result |
	result := K3NumStrandNode new.
	result addTokens: (nodes at: 1) to: result numTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForHead7: nodes [
	| result |
	result := K3SymStrandNode new.
	result addTokens: (nodes at: 1) to: result symTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForIfStmt1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem1: nodes [
	| result |
	result := K3CodeItemNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem2: nodes [
	| result |
	result := K3CodeItemNode new.
	result addToken: (nodes at: 1) to: result commentTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem4: nodes [
	| result |
	result := K3CodeItemNode new.
	result addToken: (nodes at: 2) to: result commentTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForItem5: nodes [
	| result |
	result := K3CmdItemNode new.
	result cmdToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLambda1: nodes [
	| result |
	result := K3LambdaNode new.
	result addToken: (nodes at: 1) to: result leftBraceTokens.
	result addToken: (nodes at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLambda2: nodes [
	| result |
	result := K3LambdaNode new.
	result addToken: (nodes at: 1) to: result leftBraceTokens.
	result addToken: ((nodes at: 2) at: 1) to: result leftBracketTokens.
	result addToken: ((nodes at: 2) at: 2) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result semicolonTokens.
	result addToken: (nodes at: 4) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForLine1: nodes [
	| result |
	result := K3LineNode new.
	result addToken: (nodes at: 2) to: result nlTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForList1: nodes [
	| result |
	result := K3ListNode new.
	result addToken: (nodes at: 1) to: result leftParenTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForSig1: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForSig2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	result at: 2 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForStmt1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForStmt2: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForStmt3: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionForTail1: nodes [
	| result |
	result := nodes at: 1.
	self addAll: (nodes at: 2) to: (result at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Block______2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Stmt_1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Stmt__1: nodes [
	| result |
	result := Array new: 23.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_____Stmt__2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor______ident__1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor______ident___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor______ident___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor__adv___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_num__1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
K3Parser >> reduceActionFor_num__2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]
