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
"  addChild: crumbs;
"  addChild: (BrHorizontalPane new
    addChild: (self label: 'Protocol' above: protoList);
    addChild: (self label: 'Methods' above: methodList);
    matchParent);
  matchParent
  
]

{ #category : #'*Tangentstorm' }
TsClassBrowser >> for: aClass [
  theClass := aClass.
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
    itemStencil: self makeLabel;
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]
