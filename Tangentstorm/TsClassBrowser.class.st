Class {
	#name : #TsClassBrowser,
	#superclass : #BlElement,
	#instVars : [
		'theClass',
		'crumbs',
		'protoList',
		'methodList'
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
      addChild: (self label: 'Methods' above: methodList);
      matchParent);
    matchParent
  
]

{ #category : #'*Tangentstorm' }
TsClassBrowser >> for: aClass [
  theClass := aClass.
  crumbs := self makeCrumbs.
  methodList := self makeListFor: {}
    withLabel: #name
    onClick: [methodList selectedItemDo: [:it|
      methodList phlow spawnObject: it]].
  protoList := self makeListFor: (theClass protocols sorted)
    withLabel: #value
    onClick:[
      protoList selectedItemDo: [:it|
        methodList deselectAll;
        items: (theClass methodsInProtocol: it)]].
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

{ #category : #'*Tangentstorm' }
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
theClass withAllSuperclasses reversed do: [:x|
  crumbs addItem: (BrLabel new
    aptitude: BrGlamorousLabelAptitude; 
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

{ #category : #'*Tangentstorm' }
TsClassBrowser >> makeListFor: items withLabel: getLabelStr onClick: onClick [
  ^ BrSimpleList new
    items: items;
    itemStencil: [self makeLabel];
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]
