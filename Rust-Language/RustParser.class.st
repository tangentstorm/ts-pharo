Class {
	#name : #RustParser,
	#superclass : #SmaCCParser,
	#category : #'Rust-Language'
}

{ #category : #'generated-accessing' }
RustParser class >> cacheId [
	^'2021-04-17T21:02:01.441736-04:00'
]

{ #category : #generated }
RustParser class >> definitionComment [
"%annotate_tokens;
%root TokenTree;
%prefix RustAST;
%suffix Node;


# this rule seems overly complicated but mine wasn't working so i stole this from CPPParser.
<comment> : \/\/ [^\r\n]*
            | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
            ; 
<whitespace> : \s+ ;

# basic tokens
<string> : "" (\\"" | [^""])* "";
<char> : '.' ;
<number> : \d+;
<iden>  : [_a-zA-Z][_a-zA-Z0-9]*;
<other> : [~!@#$%^&*+=.,;:|\-/<>?'];

# Rust macros can contain any valid token tree.
# These can contain any valid rust tokens in any order -- 
# so long as parens, braces, and brackets are balanced.

TokenTree : (Token 'item' | Tree 'item')* {{}};

Tree : ""("" TokenTree 'tree' "")"" {{ParenGroup}}
     | ""["" TokenTree 'tree' ""]"" {{BrackGroup}}
     | ""{"" TokenTree 'tree' ""}"" {{BraceGroup}};
     
  
Token : <comment> {{}} 
      | <string> {{}}
      | <char>   {{}}
      | <number> {{}}
      | <iden>   {{}}
      | <other>  {{}};"
]

{ #category : #generated }
RustParser class >> reduceTable [
^#(
	#(17 0 #reduceActionFor_Token__item____Tree__item___1: 637953 false ) 
	#(15 1 #reduceActionForTokenTree1: 625665 false ) 
	#(19 1 #reduceActionForToken1: 837633 false ) 
	#(19 1 #reduceActionForToken2: 837634 false ) 
	#(19 1 #reduceActionForToken3: 837635 false ) 
	#(19 1 #reduceActionForToken4: 837636 false ) 
	#(19 1 #reduceActionForToken5: 837637 false ) 
	#(19 1 #reduceActionForToken6: 837638 false ) 
	#(17 2 #reduceActionFor_Token__item____Tree__item___2: 637954 false ) 
	#(16 1 #liftFirstValue: 637954 false ) 
	#(16 1 #liftFirstValue: 637953 false ) 
	#(18 3 #reduceActionForTree1: 677889 false ) 
	#(18 3 #reduceActionForTree2: 677890 false ) 
	#(18 3 #reduceActionForTree3: 677891 false )
	).
]

{ #category : #generated }
RustParser class >> scannerClass [
	^RustScanner
]

{ #category : #generated }
RustParser class >> startingStateForTokenTree [
	^ 1
]

{ #category : #generated }
RustParser class >> symbolNames [
	^ #('"("' '")"' '"["' '"]"' '"{"' '"}"' '<comment>' '<whitespace>' '<string>' '<char>' '<number>' '<iden>' '<other>' 'B e g i n' 'TokenTree' '(Token ''item'' | Tree ''item'')' '(Token ''item'' | Tree ''item'')*' 'Tree' 'Token' 'E O F' 'error')
]

{ #category : #generated }
RustParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #RustASTTokenTreeNode #RustASTTokenTreeNode #RustASTTokenTreeNode #OrderedCollection #RustASTTokenTreeNode #RustASTTokenNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
RustParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 9 0 15 0 13 0 17 0 6 0 20] 
#[0 0 0 0 20] 
#[1 0 17 0 1 0 10 0 2 0 21 0 3 0 10 0 4 0 25 0 5 0 10 0 6 0 29 0 7 0 33 0 9 0 37 0 10 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 16 0 53 0 18 0 53 0 19 0 10 0 20] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 5 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 65 0 15 0 13 0 17] 
#[1 0 6 0 1 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 69 0 15 0 13 0 17] 
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 73 0 15 0 13 0 17] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 22 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 38 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 77 0 2] 
#[0 0 81 0 4] 
#[0 0 85 0 6] 
#[0 0 50 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20] 
#[0 0 58 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 20]
	).
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken1: nodes [
	| result |
	result := RustASTTokenNode new.
	result commentToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken2: nodes [
	| result |
	result := RustASTTokenNode new.
	result stringToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken3: nodes [
	| result |
	result := RustASTTokenNode new.
	result charToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken4: nodes [
	| result |
	result := RustASTTokenNode new.
	result numberToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken5: nodes [
	| result |
	result := RustASTTokenNode new.
	result idenToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForToken6: nodes [
	| result |
	result := RustASTTokenNode new.
	result otherToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForTokenTree1: nodes [
	| result |
	result := RustASTTokenTreeNode new.
	result addNodes: (nodes at: 1) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForTree1: nodes [
	| result |
	result := RustASTParenGroupNode new.
	result leftParenToken: (nodes at: 1).
	result tree: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForTree2: nodes [
	| result |
	result := RustASTBrackGroupNode new.
	result leftBracketToken: (nodes at: 1).
	result tree: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForTree3: nodes [
	| result |
	result := RustASTBraceGroupNode new.
	result leftBraceToken: (nodes at: 1).
	result tree: (nodes at: 2).
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_Token__item____Tree__item___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_Token__item____Tree__item___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]
