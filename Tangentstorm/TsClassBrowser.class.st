Class {
	#name : #TsClassBrowser,
	#superclass : #BlElement,
	#instVars : [
		'theClass',
		'crumbs',
		'protoList',
		'methodList',
		'codeArea',
		'editorFrame'
	],
	#category : #Tangentstorm
}

{ #category : #'*Tangentstorm' }
TsClassBrowser class >> for: aClass [
  ^ self new for: aClass 
]

{ #category : #accessing }
TsClassBrowser >> asElement [
  ^ BrVerticalPane new
    addChild: crumbs;
    addChild: (BrHorizontalPane new
      addChild: (self label: 'Protocol' above: protoList);
      addChild: (self label: 'Methods' above:
        (methodList stream: {} asAsyncStream));
      matchParent);
    addChild: (BrFrame new
      matchParent;
      addAptitude: (BrGlamorousWithVerticalResizerAptitude new beTop);
      addChild: (editorFrame := BrFrame new matchParent));
    matchParent
]

{ #category : #accessing }
TsClassBrowser >> editMethod: aMethod [
  editorFrame removeChildren;
    matchParent;
    addChild: ((GtPharoMethodCoder 
      forMethod: aMethod)  asElement
      hMatchParent; vFitContent);
    requestLayout
]

{ #category : #accessing }
TsClassBrowser >> for: aClass [
  theClass := aClass.
  crumbs := self makeCrumbs.
  methodList := self makeMethodList.
  protoList := self makeListFor: (theClass protocols sorted)
    withLabel: #value
    onClick:[
      protoList selectedItemDo: [:it|
        self listMethodsForProtocol: it]].
]

{ #category : #accessing }
TsClassBrowser >> label: str above: el [ 
^ BrVerticalPane new
  addChild: (self makeLabel text: str;
    background: (Color fromHexString: 'f8f8f8');
    hMatchParent);
  addChild: el;
  matchParent
]

{ #category : #accessing }
TsClassBrowser >> listMethodsForProtocol: aProtocol [
  | items groups |

  items := theClass methodsInProtocol: aProtocol.
  items := items groupedBy: [:x| x traitSource ifNil: [x classBinding value]].

  groups := items associations asAsyncStream collect: [:x|
    BrGroup new
      stream: (x value sorted: [:a :b| a name < b name])
        asAsyncStream;
      domainObject: x key name;
      itemStencil: [BrLabel new hMatchParent;
        aptitude: BrGlamorousLabelAptitude
                + BrGlamorousListItemAptitude];
      itemDataBinder: [:w :it| w text: it selector];
      shouldShowWithoutItems: true].

  methodList deselectAll; stream: groups

]

{ #category : #accessing }
TsClassBrowser >> makeCrumbs [
|makeSeparator|
makeSeparator :=  [
  BrLabel new
    aptitude: (BrGlamorousLabelAptitude new thin
      foreground: Color gray);
	text: '>';
	margin: (BlInsets left: 5 right: 5) ].

crumbs := BrBreadcrumb new
  padding: (BlInsets all: 2);
  background: (Color fromHexString: 'eeeeee');
  hMatchParent;
  aptitude: (BrGlamorousBreadcrumbAptitude new
    separator: makeSeparator).
theClass withAllSuperclasses reversed do: [:x| |lbl|
  crumbs addItem: (lbl := BrLabel new
    aptitude: BrGlamorousLabelAptitude; 
    when: BlClickEvent do: [
      crumbs childrenDo: [:c| c background: Color transparent].
      lbl background: Color veryVeryLightGray.
      lbl phlow spawnObject: x];
    text: x name)].
 ^ crumbs
]

{ #category : #accessing }
TsClassBrowser >> makeLabel [
 ^ BrLabel new
    aptitude: BrGlamorousLabelAptitude new
      +(BrStyleCommonAptitude new
        selected:[:aStyle|
          aStyle background:
            (Color fromHexString: 'ccddff')]);
    hMatchParent;
	padding: (BlInsets all: 2)
]

{ #category : #accessing }
TsClassBrowser >> makeListFor: items withLabel: getLabelStr onClick: onClick [
  ^ BrSimpleList new
    items: items;
    itemStencil: [self makeLabel];
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]

{ #category : #accessing }
TsClassBrowser >> makeMethodList [
  ^ BrGroupedList new
    headerElementStencil: [ BrLabel new
    margin: (BlInsets top: 10);
    aptitude: (BrGlamorousLabelAptitude new
      foreground: Color gray)];
    when: BrSelectionChanged do: [
      methodList selectedEntityDo: [:it|
        self editMethod: it itemObject] ];
    headerDataBinder: [:h :x| h text: x domainObject].
]

{ #category : #accessing }
TsClassBrowser >> selectProtocol: aProtocol [
  methodList
    deselectAll;
    items: (theClass methodsInProtocol: aProtocol)
]
