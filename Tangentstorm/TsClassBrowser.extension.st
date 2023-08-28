Extension { #name : #TsClassBrowser }

{ #category : #'*Tangentstorm' }
TsClassBrowser >> editMethod: aMethod [
  editorFrame removeChildren;
    matchParent;
    addChild: ((GtPharoMethodCoder 
      forMethod: aMethod)  asElement
      hMatchParent; vFitContent);
    requestLayout
]

{ #category : #'*Tangentstorm' }
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

{ #category : #'*Tangentstorm' }
TsClassBrowser class >> for: aClass [
  ^ self new for: aClass 
]

{ #category : #'*Tangentstorm' }
TsClassBrowser >> listMethodsForProtocol: aProtocol [
  | items groups |

  items := theClass methodsInProtocol: aProtocol.
  items := items groupedBy: [:x|
    x traitSource ifNil: [theClass]].

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

{ #category : #'*Tangentstorm' }
TsClassBrowser >> makeListFor: items withLabel: getLabelStr onClick: onClick [
  ^ BrSimpleList new
    items: items;
    itemStencil: [self makeLabel];
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]

{ #category : #'*Tangentstorm' }
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

{ #category : #'*Tangentstorm' }
TsClassBrowser >> selectProtocol: aProtocol [
  methodList
    deselectAll;
    items: (theClass methodsInProtocol: aProtocol)
]
