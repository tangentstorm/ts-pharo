Class {
	#name : #RustParser,
	#superclass : #SmaCCGLRParser,
	#category : #'Rust-Language'
}

{ #category : #generated }
RustParser class >> ambiguousTransitions [
^#(
#[ 0 146 1 21] 
#[ 0 150 1 21]
	).
]

{ #category : #'generated-accessing' }
RustParser class >> cacheId [
	^'2021-04-17T23:19:24.072665-04:00'
]

{ #category : #generated }
RustParser class >> definitionComment [
"%annotate_tokens;
%root Source;
%prefix RustAST;
%suffix Node;
%glr;

# i stole this from CPPParser.
<comment> : \/\/ [^\r\n]*
            | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
            ;
<whitespace> : \s+ ;

# Rust Source code is a well-defined subset of a token tree.
# https://doc.rust-lang.org/reference/crates-and-source-files.html
<shebang>: \#\!![^\r\n]* ;
Source: <shebang> 'shebang'? (InnerAttribute 'attr')* (Item 'item')* {{}};

# attributes https://doc.rust-lang.org/reference/attributes.html
InnerAttribute: ""#!!["" TokenTree 'tree' ""]"" {{}};
OuterAttribute: ""#["" TokenTree 'tree' ""]"" {{}};

# items : crate components
# https://doc.rust-lang.org/reference/items.html
Item
  : (OuterAttribute 'attr')* VisItem 'item' {{}}
  | MacroItem
  ;

Visibility
  : ""pub""
  | ""pub"" ""("" ""crate"" "")""
  | ""pub"" ""("" ""self"" "")""
  | ""pub"" ""("" ""super"" "")""
  | ""pub"" ""("" ""in"" SimplePath "")""
  ;

VisItem
  : (Visibility 'vis')?
    (
    # Module
    #| ExternCrate
    #|
     UseDeclaration 'item'
    #| Function
    #| TypeAlias
    #| Struct
    #| Enumeration
    #| Union
    #| ConstantItem
    #| StaticItem
    #| Trait
    #| Implementation
    #| ExternBlock
    ) {{}};

# https://doc.rust-lang.org/reference/items/use-declarations.html
UseDeclaration : ""use"" UseTree "";"" {{}};
UseTree
  : (SimplePath ? ""::"" )? ""*""
  | (SimplePath ? ""::"" )? ""{"" ( UseTree ("","" UseTree)* "",""? )? ""}""
  | SimplePath ( ""as"" ( <iden> | ""_"" ) )?
  ;

SimplePath : ""::"" ? SimplePathSegment (""::"" SimplePathSegment) * ;
SimplePathSegment : <iden> | ""super"" | ""self"" | ""crate"" | ""$crate"" ;

MacroItem
  : MacroInvocationSemi {{}}
  | MacroRulesDefinition {{}}
  ;

MacroInvocationSemi
  : SimplePath 'path' ""!!"" ""("" TokenTree 'tree' "")"" "";"" {{}}
  | SimplePath 'path' ""!!"" ""["" TokenTree 'tree' ""]"" "";"" {{}}
  | SimplePath 'path' ""!!"" ""{"" TokenTree 'tree' ""}""  {{}}
  ;

MacroRulesDefinition
  : ""macro_rules"" ""!!"" <iden> Tree "";"" ?
  ;


# basic tokens
<string> : "" (\\"" | [^""])* "";
<char> : '.' ;
<number> : \d+;
<iden>  : [_a-zA-Z][_a-zA-Z0-9]*;
<other> : [~!!@#$%^&*+=.,;:|\-/<>?'];

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
      | <other>  {{}}
      ;"
]

{ #category : #generated }
RustParser class >> reduceTable [
^#(
	#(35 0 #reduceActionFor_InnerAttribute__attr___1: 430081 false ) 
	#(37 0 #reduceActionFor_InnerAttribute__attr___1: 455681 false ) 
	#(58 0 #reduceActionFor_InnerAttribute__attr___1: 2406401 false ) 
	#(35 2 #reduceActionFor_InnerAttribute__attr___2: 430082 false ) 
	#(42 0 #reduceActionFor_InnerAttribute__attr___1: 742401 false ) 
	#(33 2 #reduceActionForSource1: 400385 false ) 
	#(34 1 #liftFirstValue: 430081 false ) 
	#(33 3 #reduceActionForSource2: 400386 false ) 
	#(56 1 #reduceActionForTokenTree1: 2394113 false ) 
	#(52 1 #reduceActionForSimplePathSegment5: 1617925 false ) 
	#(52 1 #reduceActionForSimplePathSegment4: 1617924 false ) 
	#(52 1 #reduceActionForSimplePathSegment3: 1617923 false ) 
	#(52 1 #reduceActionForSimplePathSegment2: 1617922 false ) 
	#(52 1 #reduceActionForSimplePathSegment1: 1617921 false ) 
	#(37 2 #reduceActionFor_InnerAttribute__attr___2: 455682 false ) 
	#(36 1 #liftFirstValue: 455681 false ) 
	#(51 0 #reduceActionFor______SimplePathSegment___1: 1587201 false ) 
	#(40 1 #liftFirstValue: 732162 false ) 
	#(53 1 #reduceActionForMacroItem1: 1691649 false ) 
	#(53 1 #reduceActionForMacroItem2: 1691650 false ) 
	#(38 3 #reduceActionForInnerAttribute1: 547841 false ) 
	#(60 1 #reduceActionForToken1: 2596865 false ) 
	#(60 1 #reduceActionForToken2: 2596866 false ) 
	#(60 1 #reduceActionForToken3: 2596867 false ) 
	#(60 1 #reduceActionForToken4: 2596868 false ) 
	#(60 1 #reduceActionForToken5: 2596869 false ) 
	#(60 1 #reduceActionForToken6: 2596870 false ) 
	#(58 2 #reduceActionFor_InnerAttribute__attr___2: 2406402 false ) 
	#(57 1 #liftFirstValue: 2406402 false ) 
	#(57 1 #liftFirstValue: 2406401 false ) 
	#(43 1 #liftFirstValue: 812033 false ) 
	#(41 1 #liftFirstValue: 742401 false ) 
	#(42 2 #reduceActionFor_InnerAttribute__attr___2: 742402 false ) 
	#(40 2 #reduceActionForItem1: 732161 false ) 
	#(44 1 #reduceActionForVisItem1: 960513 false ) 
	#(49 2 #reduceActionForSimplePath1: 1548289 false ) 
	#(49 3 #reduceActionForSimplePath2: 1548290 false ) 
	#(46 1 #reduceActionForUseTree1: 1386497 false ) 
	#(46 1 #reduceActionForUseTree13: 1386509 false ) 
	#(44 2 #reduceActionForVisItem2: 960514 false ) 
	#(51 2 #reduceActionFor______SimplePathSegment___2: 1587202 false ) 
	#(59 3 #reduceActionForTree1: 2446337 false ) 
	#(59 3 #reduceActionForTree2: 2446338 false ) 
	#(59 3 #reduceActionForTree3: 2446339 false ) 
	#(55 4 #reduceActionForMacroRulesDefinition1: 1988609 false ) 
	#(39 3 #reduceActionForOuterAttribute1: 600065 false ) 
	#(46 2 #reduceActionForUseTree2: 1386498 false ) 
	#(46 2 #reduceActionForUseTree4: 1386500 false ) 
	#(48 0 #reduceActionFor_____UseTree__1: 1468417 false ) 
	#(45 3 #reduceActionForUseDeclaration1: 1343489 false ) 
	#(50 2 #reduceActionFor______SimplePathSegment_1: 1587201 false ) 
	#(55 5 #reduceActionForMacroRulesDefinition2: 1988610 false ) 
	#(43 4 #liftFirstValue: 812034 false ) 
	#(43 4 #liftFirstValue: 812035 false ) 
	#(43 4 #liftFirstValue: 812036 false ) 
	#(46 3 #reduceActionForUseTree7: 1386503 false ) 
	#(46 3 #reduceActionForUseTree3: 1386499 false ) 
	#(46 3 #reduceActionForUseTree15: 1386511 false ) 
	#(46 3 #reduceActionForUseTree14: 1386510 false ) 
	#(54 5 #reduceActionForMacroInvocationSemi3: 1772547 false ) 
	#(43 5 #reduceActionForVisibility5: 812037 false ) 
	#(46 4 #reduceActionForUseTree5: 1386501 false ) 
	#(48 2 #reduceActionFor_____UseTree__2: 1468418 false ) 
	#(46 4 #reduceActionForUseTree10: 1386506 false ) 
	#(54 6 #reduceActionForMacroInvocationSemi1: 1772545 false ) 
	#(54 6 #reduceActionForMacroInvocationSemi2: 1772546 false ) 
	#(46 5 #reduceActionForUseTree8: 1386504 false ) 
	#(46 5 #reduceActionForUseTree6: 1386502 false ) 
	#(47 2 #reduceActionFor_____UseTree_1: 1468417 false ) 
	#(46 6 #reduceActionForUseTree9: 1386505 false ) 
	#(46 6 #reduceActionForUseTree11: 1386507 false ) 
	#(46 7 #reduceActionForUseTree12: 1386508 false )
	).
]

{ #category : #generated }
RustParser class >> scannerClass [
	^RustScanner
]

{ #category : #generated }
RustParser class >> startingStateForSource [
	^ 1
]

{ #category : #generated }
RustParser class >> symbolNames [
	^ #('"!!"' '"#!!["' '"#["' '"$crate"' '"("' '")"' '"*"' '","' '"::"' '";"' '"["' '"]"' '"_"' '"as"' '"crate"' '"in"' '"macro_rules"' '"pub"' '"self"' '"super"' '"use"' '"{"' '"}"' '<comment>' '<whitespace>' '<shebang>' '<string>' '<char>' '<number>' '<iden>' '<other>' 'B e g i n' 'Source' '(InnerAttribute ''attr'')' '(InnerAttribute ''attr'')*' '(Item ''item'')' '(Item ''item'')*' 'InnerAttribute' 'OuterAttribute' 'Item' '(OuterAttribute ''attr'')' '(OuterAttribute ''attr'')*' 'Visibility' 'VisItem' 'UseDeclaration' 'UseTree' '("," UseTree)' '("," UseTree)*' 'SimplePath' '("::" SimplePathSegment)' '("::" SimplePathSegment) *' 'SimplePathSegment' 'MacroItem' 'MacroInvocationSemi' 'MacroRulesDefinition' 'TokenTree' '(Token ''item'' | Tree ''item'')' '(Token ''item'' | Tree ''item'')*' 'Tree' 'Token' 'E O F' 'error')
]

{ #category : #generated }
RustParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #RustASTSourceNode #RustASTSourceNode #RustASTInnerAttributeNode #OrderedCollection #RustASTSourceNode #OrderedCollection #RustASTInnerAttributeNode #RustASTOuterAttributeNode #RustASTSourceNode #RustASTOuterAttributeNode #OrderedCollection #Object #RustASTVisItemNode #RustASTUseDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #RustASTMacroItemNode #RustASTMacroInvocationSemiNode #OrderedCollection #RustASTTokenTreeNode #RustASTSourceNode #OrderedCollection #RustASTSourceNode #RustASTTokenNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
RustParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 9 0 6 0 15 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 9 0 26 0 6 0 30 0 13 0 33 0 17 0 35 0 6 0 61] 
#[1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 9 0 6 0 15 0 6 0 17 0 6 0 18 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 30 0 21 0 35 0 6 0 61] 
#[0 0 0 0 61] 
#[1 0 25 0 2 0 10 0 3 0 10 0 4 0 10 0 9 0 10 0 15 0 10 0 17 0 10 0 18 0 10 0 19 0 10 0 20 0 10 0 21 0 10 0 30 0 29 0 34 0 33 0 37 0 29 0 38 0 10 0 61] 
#[1 0 25 0 2 0 10 0 3 0 10 0 4 0 10 0 9 0 10 0 15 0 10 0 17 0 10 0 18 0 10 0 19 0 10 0 20 0 10 0 21 0 10 0 30 0 29 0 34 0 41 0 37 0 29 0 38 0 10 0 61] 
#[1 0 14 0 5 0 14 0 11 0 14 0 12 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 0 45 0 56 0 49 0 58] 
#[0 0 18 0 2 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 22 0 3 0 53 0 4 0 57 0 9 0 61 0 15 0 65 0 17 0 22 0 18 0 69 0 19 0 73 0 20 0 22 0 21 0 77 0 30 0 81 0 36 0 81 0 40 0 89 0 42 0 93 0 49 0 97 0 52 0 81 0 53 0 105 0 54 0 109 0 55 0 26 0 61] 
#[0 0 30 0 2 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 22 0 3 0 53 0 4 0 57 0 9 0 61 0 15 0 65 0 17 0 22 0 18 0 69 0 19 0 73 0 20 0 22 0 21 0 77 0 30 0 81 0 36 0 81 0 40 0 89 0 42 0 93 0 49 0 97 0 52 0 81 0 53 0 105 0 54 0 109 0 55 0 34 0 61] 
#[0 0 113 0 12] 
#[1 0 117 0 5 0 38 0 6 0 121 0 11 0 38 0 12 0 125 0 22 0 38 0 23 0 129 0 24 0 133 0 27 0 137 0 28 0 141 0 29 0 145 0 30 0 149 0 31 0 153 0 57 0 153 0 59 0 153 0 60] 
#[0 0 42 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[1 0 53 0 4 0 61 0 15 0 69 0 19 0 73 0 20 0 77 0 30 0 165 0 52] 
#[0 0 46 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 169 0 1] 
#[0 0 50 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 54 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 58 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 62 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 66 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 173 0 3 0 177 0 18 0 181 0 21 0 189 0 39 0 189 0 41 0 193 0 43 0 197 0 44 0 201 0 45] 
#[0 0 205 0 1] 
#[1 0 70 0 1 0 70 0 6 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 14 0 70 0 23 0 209 0 51] 
#[0 0 74 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 78 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 82 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 86 0 2 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 14 0 5 0 14 0 6 0 14 0 11 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 0 213 0 56 0 49 0 58] 
#[1 0 14 0 5 0 14 0 11 0 14 0 12 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 0 217 0 56 0 49 0 58] 
#[1 0 14 0 5 0 14 0 11 0 14 0 22 0 14 0 23 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 0 221 0 56 0 49 0 58] 
#[0 0 90 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 94 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 98 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 102 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 106 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 110 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 114 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 118 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[0 0 122 0 5 0 6 0 11 0 12 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31] 
#[1 0 70 0 1 0 70 0 6 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 14 0 70 0 23 0 225 0 51] 
#[0 0 229 0 30] 
#[1 0 14 0 5 0 14 0 11 0 14 0 12 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 0 233 0 56 0 49 0 58] 
#[1 0 237 0 5 0 126 0 21] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 0 77 0 30 0 253 0 46 1 1 0 49 0 97 0 52] 
#[0 0 130 0 3 0 18 0 21] 
#[0 0 134 0 3 0 18 0 21] 
#[1 0 181 0 21 1 5 0 45] 
#[0 0 138 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 142 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 1 9 0 5 1 13 0 11 1 17 0 22] 
#[1 0 146 0 1 0 146 0 6 0 146 0 8 0 7 0 9 0 146 0 10 0 146 0 14 0 146 0 23 1 25 0 50] 
#[0 1 29 0 6] 
#[0 1 33 0 12] 
#[0 1 37 0 23] 
#[1 0 150 0 1 0 150 0 6 0 150 0 8 0 11 0 9 0 150 0 10 0 150 0 14 0 150 0 23 1 25 0 50] 
#[1 0 117 0 5 0 121 0 11 0 125 0 22 1 41 0 59] 
#[0 1 45 0 12] 
#[1 1 49 0 15 1 53 0 16 1 57 0 19 1 61 0 20] 
#[0 0 154 0 8 0 10 0 23] 
#[1 0 53 0 4 1 65 0 7 0 61 0 15 0 69 0 19 0 73 0 20 1 69 0 22 0 77 0 30 0 165 0 52] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 73 0 23 0 77 0 30 1 77 0 46 1 1 0 49 0 97 0 52] 
#[0 1 81 0 10] 
#[1 0 158 0 8 1 85 0 9 0 158 0 10 1 89 0 14 0 158 0 23] 
#[0 0 162 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 14 0 5 0 14 0 6 0 14 0 11 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 1 93 0 56 0 49 0 58] 
#[1 0 14 0 5 0 14 0 11 0 14 0 12 0 14 0 22 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 1 97 0 56 0 49 0 58] 
#[1 0 14 0 5 0 14 0 11 0 14 0 22 0 14 0 23 0 14 0 24 0 14 0 27 0 14 0 28 0 14 0 29 0 14 0 30 0 14 0 31 1 101 0 56 0 49 0 58] 
#[1 0 53 0 4 0 61 0 15 0 69 0 19 0 73 0 20 0 77 0 30 1 105 0 52] 
#[0 0 166 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 170 0 3 0 4 0 5 0 6 0 9 0 10 0 11 0 12 0 15 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31 0 61] 
#[0 0 174 0 3 0 4 0 5 0 6 0 9 0 10 0 11 0 12 0 15 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31 0 61] 
#[0 0 178 0 3 0 4 0 5 0 6 0 9 0 10 0 11 0 12 0 15 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 27 0 28 0 29 0 30 0 31 0 61] 
#[1 0 182 0 3 0 182 0 4 0 182 0 9 1 109 0 10 0 182 0 15 0 182 0 17 0 182 0 18 0 182 0 19 0 182 0 20 0 182 0 21 0 182 0 30 0 182 0 61] 
#[0 0 186 0 3 0 18 0 21] 
#[0 1 113 0 6] 
#[1 0 53 0 4 0 57 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 77 0 30 1 117 0 49 0 97 0 52] 
#[0 1 121 0 6] 
#[0 1 125 0 6] 
#[0 0 190 0 8 0 10 0 23] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 129 0 23 0 77 0 30 1 133 0 46 1 1 0 49 0 97 0 52] 
#[0 0 194 0 8 0 10 0 23] 
#[1 0 198 0 8 0 198 0 23 1 137 0 48] 
#[0 0 202 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 1 141 0 7 1 145 0 22] 
#[1 1 149 0 13 1 153 0 30] 
#[0 1 157 0 6] 
#[0 1 161 0 12] 
#[0 1 165 0 23] 
#[0 0 206 0 1 0 6 0 8 0 9 0 10 0 14 0 23] 
#[0 0 210 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 214 0 21] 
#[0 1 169 0 6] 
#[0 0 218 0 21] 
#[0 0 222 0 21] 
#[0 0 226 0 8 0 10 0 23] 
#[1 0 198 0 8 0 198 0 23 1 173 0 48] 
#[1 1 177 0 8 1 181 0 23 1 185 0 47] 
#[0 0 230 0 8 0 10 0 23] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 189 0 23 0 77 0 30 1 193 0 46 1 1 0 49 0 97 0 52] 
#[0 0 234 0 8 0 10 0 23] 
#[0 0 238 0 8 0 10 0 23] 
#[0 1 197 0 10] 
#[0 1 201 0 10] 
#[0 0 242 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 0 246 0 21] 
#[1 1 205 0 8 1 209 0 23 1 185 0 47] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 213 0 23 0 77 0 30 1 217 0 46 1 1 0 49 0 97 0 52] 
#[0 0 250 0 8 0 10 0 23] 
#[0 0 254 0 8 0 23] 
#[0 1 2 0 8 0 10 0 23] 
#[1 0 198 0 8 0 198 0 23 1 221 0 48] 
#[0 1 6 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[0 1 10 0 3 0 4 0 9 0 15 0 17 0 18 0 19 0 20 0 21 0 30 0 61] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 225 0 23 0 77 0 30 1 217 0 46 1 1 0 49 0 97 0 52] 
#[0 1 14 0 8 0 10 0 23] 
#[0 1 18 0 8 0 10 0 23] 
#[0 1 22 0 8 0 23] 
#[1 1 229 0 8 1 233 0 23 1 185 0 47] 
#[0 1 26 0 8 0 10 0 23] 
#[1 0 53 0 4 0 241 0 7 0 245 0 9 0 61 0 15 0 69 0 19 0 73 0 20 0 249 0 22 1 237 0 23 0 77 0 30 1 217 0 46 1 1 0 49 0 97 0 52] 
#[0 1 30 0 8 0 10 0 23] 
#[0 1 34 0 8 0 10 0 23]
	).
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForInnerAttribute1: nodes [
	| result |
	result := RustASTInnerAttributeNode new.
	result _BangBangLeftBracketToken: (nodes at: 1).
	result tree: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForItem1: nodes [
	| result |
	result := RustASTItemNode new.
	result addNodes: (nodes at: 1) to: result attrs.
	result addNode: (nodes at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroInvocationSemi1: nodes [
	| result |
	result := RustASTMacroInvocationSemiNode new.
	result path: (nodes at: 1).
	result bangBangToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result tree: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroInvocationSemi2: nodes [
	| result |
	result := RustASTMacroInvocationSemiNode new.
	result path: (nodes at: 1).
	result bangBangToken: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result tree: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroInvocationSemi3: nodes [
	| result |
	result := RustASTMacroInvocationSemiNode new.
	result path: (nodes at: 1).
	result bangBangToken: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result tree: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroItem1: nodes [
	| result |
	result := RustASTMacroItemNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroItem2: nodes [
	| result |
	result := RustASTMacroItemNode new.
	result macro_rulesToken: ((nodes at: 1) at: 1).
	result bangBangToken: ((nodes at: 1) at: 2).
	result idenToken: ((nodes at: 1) at: 3).
	result leftParenToken: ((nodes at: 1) at: 4).
	result tree: ((nodes at: 1) at: 5).
	result rightParenToken: ((nodes at: 1) at: 6).
	result leftBracketToken: ((nodes at: 1) at: 7).
	result rightBracketToken: ((nodes at: 1) at: 8).
	result leftBraceToken: ((nodes at: 1) at: 9).
	result rightBraceToken: ((nodes at: 1) at: 10).
	result semicolonToken: ((nodes at: 1) at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroRulesDefinition1: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForMacroRulesDefinition2: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 11 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForOuterAttribute1: nodes [
	| result |
	result := RustASTOuterAttributeNode new.
	result _LeftBracketToken: (nodes at: 1).
	result tree: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePath1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePath2: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 6).
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self add: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self add: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePathSegment1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePathSegment2: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePathSegment3: nodes [
	| result |
	result := Array new: 5.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePathSegment4: nodes [
	| result |
	result := Array new: 5.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSimplePathSegment5: nodes [
	| result |
	result := Array new: 5.
	result at: 5 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSource1: nodes [
	| result |
	result := RustASTSourceNode new.
	result addNodes: (nodes at: 1) to: result attrs.
	result addNodes: (nodes at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForSource2: nodes [
	| result |
	result := RustASTSourceNode new.
	result shebang: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result attrs.
	result addNodes: (nodes at: 3) to: result items.
	^ result
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
RustParser >> reduceActionForUseDeclaration1: nodes [
	| result |
	result := RustASTUseDeclarationNode new.
	result useToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result timesTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result colonColonTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result idenTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result superTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result selfTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result crateTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result _crateTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result asTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result _Tokens.
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree10: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 8).
	self add: (nodes at: 4) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree11: nodes [
	| result |
	result := nodes at: 4.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 2).
	self addFirst: (nodes at: 2) to: (result at: 2).
	self addFirst: (nodes at: 3) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 5) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 5) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 5) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 5) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 5) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 5) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 5) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 12) to: (result at: 7).
	self add: (nodes at: 6) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree12: nodes [
	| result |
	result := nodes at: 4.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 2).
	self addFirst: (nodes at: 2) to: (result at: 2).
	self addFirst: (nodes at: 3) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 5) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 5) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 5) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 5) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 5) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 5) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 5) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 12) to: (result at: 7).
	self add: (nodes at: 6) to: (result at: 10).
	self add: (nodes at: 7) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree13: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree14: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 11).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree15: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 11).
	self add: (nodes at: 3) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree1: nodes [
	| result |
	result := Array new: 12.
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
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree2: nodes [
	| result |
	result := Array new: 12.
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
	self add: (nodes at: 1) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree3: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree4: nodes [
	| result |
	result := Array new: 12.
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
	self add: (nodes at: 1) to: (result at: 8).
	self add: (nodes at: 2) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree5: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 7).
	self add: (nodes at: 4) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree6: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 7).
	self add: (nodes at: 4) to: (result at: 10).
	self add: (nodes at: 5) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree7: nodes [
	| result |
	result := Array new: 12.
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
	self add: (nodes at: 1) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 8).
	self add: (nodes at: 3) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree8: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 2).
	self addFirst: (nodes at: 2) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 7).
	self add: (nodes at: 5) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForUseTree9: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 2).
	self addFirst: (nodes at: 2) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 7).
	self add: (nodes at: 5) to: (result at: 10).
	self add: (nodes at: 6) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisItem1: nodes [
	| result |
	result := RustASTVisItemNode new.
	result addNode: (nodes at: 1) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisItem2: nodes [
	| result |
	result := RustASTVisItemNode new.
	result vis: (nodes at: 1).
	result addNode: (nodes at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisibility5: nodes [
	^ nodes at: 4
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_InnerAttribute__attr___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_InnerAttribute__attr___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_____UseTree_1: nodes [
	| result |
	result := Array new: 12.
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
	self addAll: ((nodes at: 2) at: 10) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_____UseTree__1: nodes [
	| result |
	result := Array new: 12.
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
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor_____UseTree__2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor______SimplePathSegment_1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	result at: 6 put: ((nodes at: 2) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor______SimplePathSegment___1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionFor______SimplePathSegment___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self add: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self add: ((nodes at: 2) at: 5) to: (result at: 5).
	self add: ((nodes at: 2) at: 6) to: (result at: 6).
	^ result
]
