Class {
	#name : #GsSelectorProp,
	#superclass : #GsProp,
	#instVars : [
		'readSelector',
		'writeSelector'
	],
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsSelectorProp >> read: aShape [
  ^ aShape perform: readSelector
]

{ #category : #accessing }
GsSelectorProp >> readSelector: aSymbol [
  readSelector := aSymbol
]

{ #category : #accessing }
GsSelectorProp >> write: aSize to: aShape [
  aShape perform: writeSelector withArguments: { aSize}
]

{ #category : #accessing }
GsSelectorProp >> writeSelector: aSymbol [
  writeSelector := aSymbol
]
