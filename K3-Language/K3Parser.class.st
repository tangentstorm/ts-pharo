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
	^'2023-06-13T15:31:39.168-04:00'
]

{ #category : #generated }
K3Parser class >> definitionComment [
"%annotate_tokens;
%root Start;
%prefix K3;
%suffix Node;

<whitespace> : [\ \t\f] ;
<digit> : \d;
<alpha> : [a-zA-Z];
<ident> : alpha (<alpha>|<digit>|[_])*;
<lname> : <ident> ([.] <ident>)*;
<gname> : ([.] <ident>)+;
<prim>  : [_+\-*%!&|<>=~,^#$?@.];
<string>: [""]([\\][""]|[^""])*[""];
<nl>         : \r? \n ; 
<comment>: /\s[^\r\n]* ;
<cmd>        : \\ [^\r\n]* ;
<prim>: [~!@#$%\\^&*+<>|,?=_.\-];
<adverb> : ['/\\][:]?;
<number> : \-?[0-9]+(\.[0-9]+)? ;
<builtin> : [_] (bin|di|dv|dvl|draw|gtime|ic|ci|jd|dj|lsq|dot|mul|inv|in|lin
                |sv|sm|ss|ssr|vs|abs|floor|sin|cos|tan|sinh|cosh|tanh
                |exp|log|sqr|sqrt);
<symbol> : [`](<ident>|<string>)?;
<endnote> : [\\][\r?\n]* ;
<command> : [\\] [^\r\n]* ;
# monad and augAssign are same syntax but have different meanings
<monad> : <prim>[:] ;
<augAssign>: <prim>[:];
<numcolon>: \d[:] ;

Start : Symbol;
Array : (Number Number+)
      | (Symbol Symbol +) {{Array}};
Number : <number> 'number' {number value asNumber} ; 
Symbol : <symbol> 'symbol' {symbol value asSymbol} ;
#Code : Line* Stmts? (EndNote|Command|Comment)? {{Code}};
#EndNote : <endnote>;
#Line  : Stmts? (Comment | Command)? <nl> {{Line}};
#Command : <command>;
#Comment : <comment><nl>;
#Stmts: Expr? ("";"" Expr?)* ;
#Expr : "":""|Return|Chain;
#Chain : (Cond|IfStmt|WhileStmt|DoStmt|Assign|<prim>|<monad>|<numcolon>|<builtin>|<adverb>|Lambda|Call|List|<number>|<string>|<symbol>|LValue)+ <monad>?;
#Cond : "":["" Block ""]"" {{Cond}};
#IfStmt : ""if["" Block ""]"" {{IfStmt}};
#WhileStmt: ""while["" Block ""]"" {{WhileStmt}};
#DoStmt : ""do["" Block ""]"" {{DoStmt}};
#List : ""("" Block "")"" {{List}};
#Block : Line* Stmts? {{Block}} ; 
#Assign: LValue Call* ("":""|<augAssign>) Expr {{Assign}};
#LValue: Ident Call?;
#Ident : <lname>|<gname> {{Ident}};
#Call : ""["" Block ""]"" {{Call}};
#DefArgs : ""["" <lname>? ("";"" <lname>)* ""]"" {{DefArgs}};
#Lambda : ""{"" DefArgs? Block ""}"" {{Lambda}};
#Return : "":"" Expr {{Return}};"
]

{ #category : #generated }
K3Parser class >> reduceTable [
^#(
	#(11 1 #liftFirstValue: 1038337 false) 
	#(6 1 #liftFirstValue: 899073 false)
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
	^ #('<whitespace>' '<comment>' '<number>' '<symbol>' 'B e g i n' 'Start' 'Array' 'Number+' 'Symbol +' 'Number' 'Symbol' 'E O F' 'error')
]

{ #category : #generated }
K3Parser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #Object #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
K3Parser class >> transitionTable [
^#(
#[0 0 13 0 4 0 6 0 11] 
#[0 0 6 0 12] 
#[0 0 0 0 12] 
#[0 0 10 0 12]
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
