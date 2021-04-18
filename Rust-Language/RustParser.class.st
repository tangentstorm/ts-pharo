Class {
	#name : #RustParser,
	#superclass : #SmaCCGLRParser,
	#category : #'Rust-Language'
}

{ #category : #generated }
RustParser class >> ambiguousTransitions [
^#(
#[ 0 174 1 61] 
#[ 0 178 1 61]
	).
]

{ #category : #'generated-accessing' }
RustParser class >> cacheId [
	^'2021-04-17T23:42:10.938379-04:00'
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
InnerAttribute: ""#!["" TokenTree 'tree' ""]"" {{}};
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
    # |
      ExternCrate
    | UseDeclaration 'item'
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

# https://doc.rust-lang.org/reference/items/extern-crates.html
ExternCrate : ""extern"" ""crate"" CrateRef AsClause ? "";"" ;
CrateRef : <iden> | ""self"" ;
AsClause : ""as"" (<iden> | ""_"") ;
    
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
  : ""macro_rules"" ""!"" <iden> Tree "";"" ?
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
      | Keyword {{}}
      ;

# Keywords used elsewhere in the grammar have to be 
# explicitly listed here if we want to recognize them
# inside TokenTree, since they won't be matched
# by <other> or <iden>       
Keyword : ""::"" | ""self"" | ""pub"" | ""use"" | ""extern"";"
]

{ #category : #generated }
RustParser class >> reduceTable [
^#(
	#(37 0 #reduceActionFor_InnerAttribute__attr___1: 414721 false ) 
	#(39 0 #reduceActionFor_InnerAttribute__attr___1: 440321 false ) 
	#(63 0 #reduceActionFor_InnerAttribute__attr___1: 2504705 false ) 
	#(37 2 #reduceActionFor_InnerAttribute__attr___2: 414722 false ) 
	#(44 0 #reduceActionFor_InnerAttribute__attr___1: 716801 false ) 
	#(35 2 #reduceActionForSource1: 385025 false ) 
	#(36 1 #liftFirstValue: 414721 false ) 
	#(35 3 #reduceActionForSource2: 385026 false ) 
	#(61 1 #reduceActionForTokenTree1: 2492417 false ) 
	#(57 1 #reduceActionForSimplePathSegment5: 1746949 false ) 
	#(57 1 #reduceActionForSimplePathSegment4: 1746948 false ) 
	#(57 1 #reduceActionForSimplePathSegment3: 1746947 false ) 
	#(57 1 #reduceActionForSimplePathSegment2: 1746946 false ) 
	#(57 1 #reduceActionForSimplePathSegment1: 1746945 false ) 
	#(39 2 #reduceActionFor_InnerAttribute__attr___2: 440322 false ) 
	#(38 1 #liftFirstValue: 440321 false ) 
	#(56 0 #reduceActionFor______SimplePathSegment___1: 1717249 false ) 
	#(42 1 #liftFirstValue: 707586 false ) 
	#(58 1 #reduceActionForMacroItem1: 1818625 false ) 
	#(58 1 #reduceActionForMacroItem2: 1818626 false ) 
	#(40 3 #reduceActionForInnerAttribute1: 529409 false ) 
	#(66 1 #reduceActionForSimplePathSegment1: 3052545 false ) 
	#(66 1 #reduceActionForSimplePathSegment5: 3052549 false ) 
	#(66 1 #reduceActionForSimplePathSegment3: 3052547 false ) 
	#(66 1 #reduceActionForSimplePathSegment2: 3052546 false ) 
	#(66 1 #reduceActionForSimplePathSegment4: 3052548 false ) 
	#(65 1 #reduceActionForToken1: 2689025 false ) 
	#(65 1 #reduceActionForToken2: 2689026 false ) 
	#(65 1 #reduceActionForToken3: 2689027 false ) 
	#(65 1 #reduceActionForToken4: 2689028 false ) 
	#(65 1 #reduceActionForToken5: 2689029 false ) 
	#(65 1 #reduceActionForToken6: 2689030 false ) 
	#(63 2 #reduceActionFor_InnerAttribute__attr___2: 2504706 false ) 
	#(62 1 #liftFirstValue: 2504706 false ) 
	#(62 1 #liftFirstValue: 2504705 false ) 
	#(65 1 #reduceActionForToken7: 2689031 false ) 
	#(45 1 #liftFirstValue: 782337 false ) 
	#(43 1 #liftFirstValue: 716801 false ) 
	#(44 2 #reduceActionFor_InnerAttribute__attr___2: 716802 false ) 
	#(42 2 #reduceActionForItem1: 707585 false ) 
	#(46 1 #reduceActionForVisItem1: 922625 false ) 
	#(46 1 #reduceActionForVisItem2: 922626 false ) 
	#(54 2 #reduceActionForSimplePath1: 1678337 false ) 
	#(54 3 #reduceActionForSimplePath2: 1678338 false ) 
	#(51 1 #reduceActionForUseTree1: 1522689 false ) 
	#(51 1 #reduceActionForUseTree13: 1522701 false ) 
	#(46 2 #reduceActionForVisItem3: 922627 false ) 
	#(46 2 #reduceActionForVisItem4: 922628 false ) 
	#(56 2 #reduceActionFor______SimplePathSegment___2: 1717250 false ) 
	#(64 3 #reduceActionForTree1: 2542593 false ) 
	#(64 3 #reduceActionForTree2: 2542594 false ) 
	#(64 3 #reduceActionForTree3: 2542595 false ) 
	#(60 4 #reduceActionForMacroRulesDefinition1: 2104321 false ) 
	#(41 3 #reduceActionForOuterAttribute1: 579585 false ) 
	#(48 1 #reduceActionForCrateRef2: 1343490 false ) 
	#(48 1 #reduceActionForCrateRef1: 1343489 false ) 
	#(51 2 #reduceActionForUseTree2: 1522690 false ) 
	#(51 2 #reduceActionForUseTree4: 1522692 false ) 
	#(53 0 #reduceActionFor_____UseTree__1: 1602561 false ) 
	#(50 3 #reduceActionForUseDeclaration1: 1480705 false ) 
	#(55 2 #reduceActionFor______SimplePathSegment_1: 1717249 false ) 
	#(60 5 #reduceActionForMacroRulesDefinition2: 2104322 false ) 
	#(47 4 #reduceActionForExternCrate1: 1285121 false ) 
	#(45 4 #liftFirstValue: 782338 false ) 
	#(45 4 #liftFirstValue: 782339 false ) 
	#(45 4 #liftFirstValue: 782340 false ) 
	#(51 3 #reduceActionForUseTree7: 1522695 false ) 
	#(51 3 #reduceActionForUseTree3: 1522691 false ) 
	#(51 3 #reduceActionForUseTree15: 1522703 false ) 
	#(51 3 #reduceActionForUseTree14: 1522702 false ) 
	#(59 5 #reduceActionForMacroInvocationSemi3: 1894403 false ) 
	#(49 2 #reduceActionForAsClause2: 1373186 false ) 
	#(49 2 #reduceActionForAsClause1: 1373185 false ) 
	#(47 5 #reduceActionForExternCrate2: 1285122 false ) 
	#(45 5 #reduceActionForVisibility5: 782341 false ) 
	#(51 4 #reduceActionForUseTree5: 1522693 false ) 
	#(53 2 #reduceActionFor_____UseTree__2: 1602562 false ) 
	#(51 4 #reduceActionForUseTree10: 1522698 false ) 
	#(59 6 #reduceActionForMacroInvocationSemi1: 1894401 false ) 
	#(59 6 #reduceActionForMacroInvocationSemi2: 1894402 false ) 
	#(51 5 #reduceActionForUseTree8: 1522696 false ) 
	#(51 5 #reduceActionForUseTree6: 1522694 false ) 
	#(52 2 #reduceActionFor_____UseTree_1: 1602561 false ) 
	#(51 6 #reduceActionForUseTree9: 1522697 false ) 
	#(51 6 #reduceActionForUseTree11: 1522699 false ) 
	#(51 7 #reduceActionForUseTree12: 1522700 false )
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
	^ #('"!!"' '"!"' '"#!["' '"#["' '"$crate"' '"("' '")"' '"*"' '","' '"::"' '";"' '"["' '"]"' '"_"' '"as"' '"crate"' '"extern"' '"in"' '"macro_rules"' '"pub"' '"self"' '"super"' '"use"' '"{"' '"}"' '<comment>' '<whitespace>' '<shebang>' '<string>' '<char>' '<number>' '<iden>' '<other>' 'B e g i n' 'Source' '(InnerAttribute ''attr'')' '(InnerAttribute ''attr'')*' '(Item ''item'')' '(Item ''item'')*' 'InnerAttribute' 'OuterAttribute' 'Item' '(OuterAttribute ''attr'')' '(OuterAttribute ''attr'')*' 'Visibility' 'VisItem' 'ExternCrate' 'CrateRef' 'AsClause' 'UseDeclaration' 'UseTree' '("," UseTree)' '("," UseTree)*' 'SimplePath' '("::" SimplePathSegment)' '("::" SimplePathSegment) *' 'SimplePathSegment' 'MacroItem' 'MacroInvocationSemi' 'MacroRulesDefinition' 'TokenTree' '(Token ''item'' | Tree ''item'')' '(Token ''item'' | Tree ''item'')*' 'Tree' 'Token' 'Keyword' 'E O F' 'error')
]

{ #category : #generated }
RustParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #RustASTSourceNode #RustASTSourceNode #RustASTInnerAttributeNode #OrderedCollection #RustASTSourceNode #OrderedCollection #RustASTInnerAttributeNode #RustASTOuterAttributeNode #RustASTSourceNode #RustASTOuterAttributeNode #OrderedCollection #Object #RustASTVisItemNode #OrderedCollection #OrderedCollection #OrderedCollection #RustASTUseDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #RustASTMacroItemNode #RustASTMacroInvocationSemiNode #OrderedCollection #RustASTTokenTreeNode #RustASTSourceNode #OrderedCollection #RustASTSourceNode #RustASTTokenNode #OrderedCollection #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
RustParser class >> transitionTable [
^#(
#[1 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 10 0 6 0 16 0 6 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 9 0 28 0 6 0 32 0 13 0 35 0 17 0 37 0 6 0 67] 
#[1 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 10 0 6 0 16 0 6 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 32 0 21 0 37 0 6 0 67] 
#[0 0 0 0 67] 
#[1 0 25 0 3 0 10 0 4 0 10 0 5 0 10 0 10 0 10 0 16 0 10 0 17 0 10 0 19 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 32 0 29 0 36 0 33 0 39 0 29 0 40 0 10 0 67] 
#[1 0 25 0 3 0 10 0 4 0 10 0 5 0 10 0 10 0 10 0 16 0 10 0 17 0 10 0 19 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 32 0 29 0 36 0 41 0 39 0 29 0 40 0 10 0 67] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 13 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 0 45 0 61 0 49 0 63] 
#[0 0 18 0 3 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 22 0 4 0 53 0 5 0 57 0 10 0 61 0 16 0 22 0 17 0 65 0 19 0 22 0 20 0 69 0 21 0 73 0 22 0 22 0 23 0 77 0 32 0 81 0 38 0 81 0 42 0 89 0 44 0 93 0 54 0 97 0 57 0 81 0 58 0 105 0 59 0 109 0 60 0 26 0 67] 
#[0 0 30 0 3 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 22 0 4 0 53 0 5 0 57 0 10 0 61 0 16 0 22 0 17 0 65 0 19 0 22 0 20 0 69 0 21 0 73 0 22 0 22 0 23 0 77 0 32 0 81 0 38 0 81 0 42 0 89 0 44 0 93 0 54 0 97 0 57 0 81 0 58 0 105 0 59 0 109 0 60 0 34 0 67] 
#[0 0 113 0 13] 
#[1 0 117 0 6 0 38 0 7 0 121 0 10 0 125 0 12 0 38 0 13 0 129 0 17 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 24 0 38 0 25 0 149 0 26 0 153 0 29 0 157 0 30 0 161 0 31 0 165 0 32 0 169 0 33 0 173 0 62 0 173 0 64 0 173 0 65 0 185 0 66] 
#[0 0 42 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[1 0 53 0 5 0 61 0 16 0 69 0 21 0 73 0 22 0 77 0 32 0 189 0 57] 
#[0 0 46 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 193 0 2] 
#[0 0 50 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 54 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 58 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 62 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 66 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 197 0 4 0 201 0 17 0 205 0 20 0 209 0 23 0 217 0 41 0 217 0 43 0 221 0 45 0 225 0 46 0 229 0 47 0 233 0 50] 
#[0 0 237 0 1] 
#[1 0 70 0 1 0 70 0 7 0 70 0 9 0 70 0 10 0 70 0 11 0 70 0 15 0 70 0 25 0 241 0 56] 
#[0 0 74 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 78 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 82 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 86 0 3 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 14 0 6 0 14 0 7 0 14 0 10 0 14 0 12 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 0 245 0 61 0 49 0 63] 
#[0 0 90 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 13 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 0 249 0 61 0 49 0 63] 
#[0 0 94 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 98 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 102 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 106 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 25 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 0 253 0 61 0 49 0 63] 
#[0 0 110 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 114 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 118 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 122 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 126 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 130 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 134 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 138 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 142 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[0 0 146 0 6 0 7 0 10 0 12 0 13 0 17 0 20 0 21 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33] 
#[1 0 70 0 1 0 70 0 7 0 70 0 9 0 70 0 10 0 70 0 11 0 70 0 15 0 70 0 25 1 1 0 56] 
#[0 1 5 0 32] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 13 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 1 9 0 61 0 49 0 63] 
#[0 1 13 0 16] 
#[1 1 17 0 6 0 150 0 17 0 150 0 23] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 0 77 0 32 1 33 0 51 1 37 0 54 0 97 0 57] 
#[0 0 154 0 4 0 17 0 20 0 23] 
#[0 0 158 0 4 0 17 0 20 0 23] 
#[1 0 201 0 17 0 209 0 23 1 41 0 47 1 45 0 50] 
#[0 0 162 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 166 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 170 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 1 49 0 6 1 53 0 12 1 57 0 24] 
#[1 0 174 0 1 0 174 0 7 0 174 0 9 0 7 0 10 0 174 0 11 0 174 0 15 0 174 0 25 1 65 0 55] 
#[0 1 69 0 7] 
#[0 1 73 0 13] 
#[0 1 77 0 25] 
#[1 0 178 0 1 0 178 0 7 0 178 0 9 0 11 0 10 0 178 0 11 0 178 0 15 0 178 0 25 1 65 0 55] 
#[1 0 117 0 6 0 125 0 12 0 145 0 24 1 81 0 64] 
#[0 1 85 0 13] 
#[1 1 89 0 21 1 93 0 32 1 97 0 48] 
#[1 1 101 0 16 1 105 0 18 1 109 0 21 1 113 0 22] 
#[0 0 182 0 9 0 11 0 25] 
#[1 0 53 0 5 1 117 0 8 0 61 0 16 0 69 0 21 0 73 0 22 1 121 0 24 0 77 0 32 0 189 0 57] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 1 125 0 25 0 77 0 32 1 129 0 51 1 37 0 54 0 97 0 57] 
#[0 1 133 0 11] 
#[1 0 186 0 9 1 137 0 10 0 186 0 11 1 141 0 15 0 186 0 25] 
#[0 0 190 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 194 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 14 0 6 0 14 0 7 0 14 0 10 0 14 0 12 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 1 145 0 61 0 49 0 63] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 13 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 1 149 0 61 0 49 0 63] 
#[1 0 14 0 6 0 14 0 10 0 14 0 12 0 14 0 17 0 14 0 20 0 14 0 21 0 14 0 23 0 14 0 24 0 14 0 25 0 14 0 26 0 14 0 29 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 33 1 153 0 61 0 49 0 63] 
#[1 0 53 0 5 0 61 0 16 0 69 0 21 0 73 0 22 0 77 0 32 1 157 0 57] 
#[0 0 198 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 202 0 4 0 5 0 6 0 7 0 10 0 11 0 12 0 13 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 67] 
#[0 0 206 0 4 0 5 0 6 0 7 0 10 0 11 0 12 0 13 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 67] 
#[0 0 210 0 4 0 5 0 6 0 7 0 10 0 11 0 12 0 13 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 67] 
#[1 0 214 0 4 0 214 0 5 0 214 0 10 1 161 0 11 0 214 0 16 0 214 0 17 0 214 0 19 0 214 0 20 0 214 0 21 0 214 0 22 0 214 0 23 0 214 0 32 0 214 0 67] 
#[0 0 218 0 4 0 17 0 20 0 23] 
#[0 0 222 0 11 0 15] 
#[0 0 226 0 11 0 15] 
#[1 1 165 0 11 1 169 0 15 1 173 0 49] 
#[0 1 177 0 7] 
#[1 0 53 0 5 0 57 0 10 0 61 0 16 0 69 0 21 0 73 0 22 0 77 0 32 1 181 0 54 0 97 0 57] 
#[0 1 185 0 7] 
#[0 1 189 0 7] 
#[0 0 230 0 9 0 11 0 25] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 1 193 0 25 0 77 0 32 1 197 0 51 1 37 0 54 0 97 0 57] 
#[0 0 234 0 9 0 11 0 25] 
#[1 0 238 0 9 0 238 0 25 1 201 0 53] 
#[0 0 242 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 1 205 0 8 1 209 0 24] 
#[1 1 213 0 14 1 217 0 32] 
#[0 1 221 0 7] 
#[0 1 225 0 13] 
#[0 1 229 0 25] 
#[0 0 246 0 1 0 7 0 9 0 10 0 11 0 15 0 25] 
#[0 0 250 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 0 254 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 1 233 0 14 1 237 0 32] 
#[0 1 241 0 11] 
#[0 1 2 0 17 0 23] 
#[0 1 245 0 7] 
#[0 1 6 0 17 0 23] 
#[0 1 10 0 17 0 23] 
#[0 1 14 0 9 0 11 0 25] 
#[1 0 238 0 9 0 238 0 25 1 249 0 53] 
#[1 1 253 0 9 2 1 0 25 2 5 0 52] 
#[0 1 18 0 9 0 11 0 25] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 2 9 0 25 0 77 0 32 2 13 0 51 1 37 0 54 0 97 0 57] 
#[0 1 22 0 9 0 11 0 25] 
#[0 1 26 0 9 0 11 0 25] 
#[0 2 17 0 11] 
#[0 2 21 0 11] 
#[0 1 30 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 1 34 0 11] 
#[0 1 38 0 11] 
#[0 1 42 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 1 46 0 17 0 23] 
#[1 2 25 0 9 2 29 0 25 2 5 0 52] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 2 33 0 25 0 77 0 32 2 37 0 51 1 37 0 54 0 97 0 57] 
#[0 1 50 0 9 0 11 0 25] 
#[0 1 54 0 9 0 25] 
#[0 1 58 0 9 0 11 0 25] 
#[1 0 238 0 9 0 238 0 25 2 41 0 53] 
#[0 1 62 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[0 1 66 0 4 0 5 0 10 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 32 0 67] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 2 45 0 25 0 77 0 32 2 37 0 51 1 37 0 54 0 97 0 57] 
#[0 1 70 0 9 0 11 0 25] 
#[0 1 74 0 9 0 11 0 25] 
#[0 1 78 0 9 0 25] 
#[1 2 49 0 9 2 53 0 25 2 5 0 52] 
#[0 1 82 0 9 0 11 0 25] 
#[1 0 53 0 5 1 21 0 8 1 25 0 10 0 61 0 16 0 69 0 21 0 73 0 22 1 29 0 24 2 57 0 25 0 77 0 32 2 37 0 51 1 37 0 54 0 97 0 57] 
#[0 1 86 0 9 0 11 0 25] 
#[0 1 90 0 9 0 11 0 25]
	).
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForAsClause1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForAsClause2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForCrateRef1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForCrateRef2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForExternCrate1: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self add: ((nodes at: 3) at: 1) to: (result at: 3).
	result at: 4 put: ((nodes at: 3) at: 2).
	result at: 5 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForExternCrate2: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self add: ((nodes at: 3) at: 1) to: (result at: 3).
	result at: 4 put: ((nodes at: 3) at: 2).
	result at: 6 put: ((nodes at: 4) at: 1).
	self add: ((nodes at: 4) at: 2) to: (result at: 3).
	result at: 7 put: ((nodes at: 4) at: 3).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForInnerAttribute1: nodes [
	| result |
	result := RustASTInnerAttributeNode new.
	result _BangLeftBracketToken: (nodes at: 1).
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
	result bangToken: ((nodes at: 1) at: 2).
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
RustParser >> reduceActionForToken7: nodes [
	| result |
	result := RustASTTokenNode new.
	result colonColonToken: ((nodes at: 1) at: 1).
	result selfToken: ((nodes at: 1) at: 2).
	result pubToken: ((nodes at: 1) at: 3).
	result useToken: ((nodes at: 1) at: 4).
	result externToken: ((nodes at: 1) at: 5).
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
	result externToken: ((nodes at: 1) at: 1).
	result crateToken: ((nodes at: 1) at: 2).
	result addTokens: ((nodes at: 1) at: 3) to: result idenTokens.
	result selfToken: ((nodes at: 1) at: 4).
	result semicolonToken: ((nodes at: 1) at: 5).
	result asToken: ((nodes at: 1) at: 6).
	result _Token: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisItem2: nodes [
	| result |
	result := RustASTVisItemNode new.
	result addNode: (nodes at: 1) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisItem3: nodes [
	| result |
	result := RustASTVisItemNode new.
	result vis: (nodes at: 1).
	result externToken: ((nodes at: 2) at: 1).
	result crateToken: ((nodes at: 2) at: 2).
	result addTokens: ((nodes at: 2) at: 3) to: result idenTokens.
	result selfToken: ((nodes at: 2) at: 4).
	result semicolonToken: ((nodes at: 2) at: 5).
	result asToken: ((nodes at: 2) at: 6).
	result _Token: ((nodes at: 2) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
RustParser >> reduceActionForVisItem4: nodes [
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
