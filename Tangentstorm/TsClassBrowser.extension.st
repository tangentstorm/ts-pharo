Extension { #name : #TsClassBrowser }

{ #category : #'*Tangentstorm' }
TsClassBrowser class >> for: aClass [
  ^ self new for: aClass 
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

{ #category : #'*Tangentstorm' }
TsClassBrowser >> makeListFor: items withLabel: getLabelStr onClick: onClick [
  ^ BrSimpleList new
    items: items;
    itemStencil: self makeLabel;
    itemDataBinder: [:el :it :ix|
      el text: (getLabelStr value: it)];
    when: BrSelectionChanged do:onClick.

]
