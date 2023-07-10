Extension { #name : #TsClassBrowser }

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

{ #category : #'*Tangentstorm' }
TsClassBrowser class >> for: aClass [
  ^ self new for: aClass 
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

{ #category : #'*Tangentstorm' }
TsClassBrowser >> makeListFor: items withLabel: getLabelStr onClick: onClick [
  ^ BrSimpleList new
    items: items;
    itemStencil: [self makeLabel];
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]
